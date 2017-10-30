#!/usr/bin/python2
import  re, math, sys, time, signal, requests, json, os, time, paramiko, smtplib
import RPi.GPIO as GPIO
from datetime import datetime
from display import printLCD as pLCD
from Queue import Queue
from threading import Thread
import thread
from dateutil import parser
from temp_logger import CPU

total_coins=0.0
accountId=None
tMax=15# temps commande max
serverIP="192.168.0.210"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
currentDir="/home/pi/coin_acceptor/"
uName="NO AUTHENTICATION YET"

m_timeout=1.5


def email_thread(q_email):
    FROM="livrognebar@gmail.com"
    password="Livrogn7"
    smtp_host="smtp.gmail.com"
    smtp_port=587
    TO = ["damienmeur@gmail.com", "le-danio@hotmail.com"]
    try: # make smtp server and login
        server = smtplib.SMTP(smtp_host, smtp_port)
        server.ehlo()
        server.starttls()
        server.login(FROM, password)
    except Exception as e:
        write_log("email", "Erreur login email")
    while(True):
        data= q_email.get()
        SUBJECT = data[0]#to split
        TEXT = data[1] #to split
        message = "From: %s\nTo: %s\nSubject: %s\n\n%s" % (FROM, ", ".join(TO), SUBJECT, TEXT)
        try:
            server.sendmail(FROM, TO, message)
        except Exception as e :
            write_log("email", "Erreur envoi email : Subject :  %s \n Body :  %s\n Exception : %s" %(data[0], data[1], e))
        finally:
            q_email.task_done()

def stop():
    global q_email
    global q_log
    global q_lcd
    printLCD("Goodbye !")
    q_email.join()
    q_log.join()
    q_lcd.join()
    sys.exit(0)

def leave_program():
    validate_transfert()
    stop()

def handler_child_transfert_validation(signum, frame):
    leave_program()


def validate_transfert():
    url=baseURL+"/money-flows/coinAcceptor"
    payload={ "values": total_coins, "description": "recharge par machine à jetons", "coinAuthentifier": 987, "accountId": accountId}
    if total_coins!=0:
        printLCD("WAIT FOR~VALIDATION")
        try:
            r = requests.post(url=url, data=json.dumps(payload), headers=headers)
            tokenRetour = json.loads(r.content)
        except requests.exceptions.RequestException as e:
            email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi bar n'ait pas reussi a envoyer la requete au serveur lui permettant de  valider une commande.
Ce probleme est majeur, le raspberry pi devrait etre relancer le plus rapidement possible au moyen du bouton rouge sur le domino.
Le probleme a eu lieu pour l'utilisateur %s a %s.
Resume de l'exception : %s
Resume de la commande : %s
                """%(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), e, payload)
            subject="Erreur de validation de commande a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            write_log("server", e)
            send_email(subject, email)
            stop()
        if:
            print(tokenRetour)
            printLCD("CREDIT ADDED~"+str(total_coins)+"euro")
            time.sleep(m_timeout*3)
    else:
        printLCD("NO PRODUCT")
        time.sleep(m_timeout)


def listen_rfid_validation():
    """
    while True:
        input_state = GPIO.input(port_GPIO_BUTTON)
        if input_state == False:
           os.kill(os.getpid(), signal.SIGUSR1)
           print('Button Pressed')
           time.sleep(0.5)
        time.sleep(0.05)
        """
def handler_barcode(signum, frame):
    printLCD("TIME ELAPSED~VALIDATING...")
    time.sleep(m_timeout)
    leave_program

def record_coin(timeout):
    signal.signal(signal.SIGALRM, handler_barcode)
	signal.alarm(timeout)
    while TRUE:
    """
    TO DO listen for a coin
    """
def transfert():
    time.sleep(m_timeout)
    printLCD("INSERT COINS")
    global total_coins
    t_end = time.time() + tMax
    while t_end > time.time() :
        try:
            total_coins+=record_coin(int(round(t_end -time.time())))
            print("total argent ": str(total_coins))
            printLCD("TOTAL ~"+str(total_coins)+"euro")
        except Exception as e:
            print( "Erreur enregistrement piece")
            printLCD("COIN ERROR~CALL ADMIN")
            write_log("coin", e)
    leave_program()

def auth():
    global headers
    global uAccount
    global uName
    global uId
    global role
    global available_money
    global current_money
    global accountId
    if len(sys.argv) ==1:
        print("Usage %s rfid_uid" %(sys.argv[0]))
        stop()
    uid = sys.argv[1]
    url=baseURL+"/rfid-auth-tokens"
    data={"card_id":uid}
    try:
        r=requests.post(url=url, data=json.dumps(data))
        tokenPyth=json.loads(r.content)
    except requests.exceptions.RequestException as e:
        email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi n'ait pas reussi a envoyer la requete au serveur pour authentifier un utilisateur avec sa carte rfid.
Il s'agit d'un probleme majeur, le serveur etant connecte en local. Il doit s'agir d'une surchauffe du raspberry pi bar.
Pour resoudre le probleme, il faudrait le redemarrer au moyenne du boutton rouge du domino.
Resume de l'exception : %s \n
Le probleme a eu lieu a %s."
            """%(e, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        subject="Erreur de connexion pour l'authentification par carte a %s" %(datetime.now().strftime("%Y-%m_%d %H:%M:%S"))
        send_email(subject, email)
        write_log("server", e)
        printLCD("Erreur connexion serveur")
        time.sleep(m_timeout*2)
        stop()
    if "value" not in tokenPyth:
        printLCD("CARD NOT IN~THE SYSTEM!")
        time.sleep(m_timeout)
        stop()
    tokenTemp=tokenPyth["value"]
    token = tokenTemp[1][1:len(tokenTemp[1])-1]
    token = tokenTemp.replace("\\", "")
    uName=tokenPyth["user"]["firstname"]+"_"+tokenPyth["user"]["lastname"]
    uName.replace("\ ","")
    uName=uName[:15]
    uId=tokenPyth["user"]["id"]
    role=tokenPyth["user"]["role"]
    if role =="ROLE_USER" or role =="ROLE_ADMIN":
        available_money=str(tokenPyth['user']["user_accounts"][0]["available_balance"])
        current_money=str(tokenPyth['user']["user_accounts"][0]["money_balance"])
        accountId= tokenPyth['user']["user_accounts"][0]["id"]
    else:
        printLCD("WRONG CARD")
        time.sleep(m_timeout)
        stop()
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}


def log_thread(q_log):
    log_coin_f = open(currentDir+"logs/coin.log","a")
    while True:
        data = q_log.get()
        message = uName+" at "+datetime.now().strftime("%Y-%m-%d %H:%M:%S")+" : "+str(data[1])+"\n"
        print(data[0]+" : "+message)
        if data[0]=="coin":
            log_coin_f.write(message)
        q_log.task_done()

def LCD_thread(q_lcd):
    while True:
        data=q_lcd.get()
        try:
            print(data)
            pLCD(data)
        except Exception as e:
            write_log("lcd",str(e))
        finally:
            q_lcd.task_done()

def send_email(subject, body):
	global q_email
	q_email.put([subject,body])

def printLCD(string):
    global q_lcd
    q_lcd.put(string)

def write_log(log, message):
    global q_log
    q_log.put([log,message])

def main():
    global q_lcd
    global q_email
    global q_log
    global p1
    global p2
    global p3
    q_email= Queue()
    q_lcd= Queue()
    q_log= Queue()
    p1=Thread(target=email_thread, args=(q_email,))
    p2=Thread(target=LCD_thread, args=(q_lcd,))
    p3=Thread(target=log_thread, args=(q_log,))
    p4=Thread(target=listen_rfid_validation)
    p1.setDaemon(True)
    p2.setDaemon(True)
    p3.setDaemon(True)
    p4.setDaemon(True)
    p1.start()
    p2.start()
    p3.start()
    auth()
    p4.start()
    transfert()
main()

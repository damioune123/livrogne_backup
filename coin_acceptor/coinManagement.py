#!/usr/bin/python2
import  re, math, sys, time, signal, requests, json, os, time, smtplib
import RPi.GPIO as GPIO
from  serial import Serial
from datetime import datetime, timedelta
from display import printLCD as pLCD
from Queue import Queue
from threading import Thread
import thread

maxCoinTime=1
total_coins=0.0
accountId=None
tMax=15# temps transfert max
serverIP="192.168.0.210"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
currentDir="/home/pi/coin_acceptor/"
uName="NO AUTHENTICATION YET"
ser = None
port_GPIO_COIN=26
m_timeout=1.5
def sigint_handler(signal, frame):
    stop()
def raise_error_arduino():
    global q_arduino_send
    write_log("coin", "erreur connexion arduino")
    email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi photomaton ne soit pas connecte en usb au compteur de pieces.
Le probleme a eu lieu pour l'utilisateur %s a %s.
        """%(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    subject="Erreur connexion usb connecteur pieces a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    send_email(subject, email)
    try:
        q_arduino_send.task_done()
    except:
        pass
    os.kill(os.getpid(), signal.SIGINT)



def handler_alarm_arduino(signum, frame):
    global q_arduino_send
    email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi photomaton ait un probleme pour communiquer en serial (usb) avec le compteur de pieces.
Le probleme a eu lieu pour l'utilisateur %s a %s.
        """%(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    subject="Erreur communication usb connecteur piece a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    send_email(subject, email)
    try:
        q_arduino_send.task_done()
    except:
        pass
    os.kill(os.getpid(), signal.SIGINT)


def switch_on_coin_acceptor():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_COIN, GPIO.OUT)
    GPIO.output(port_GPIO_COIN, GPIO.LOW)

def switch_off_coin_acceptor():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_COIN, GPIO.OUT)
    GPIO.output(port_GPIO_COIN, GPIO.HIGH)


def get_arduino_connection():
    global ser
    if ser !=None and not ser.isOpen():
        ser.flushInput()
        ser.write('3'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
        ibuffer=ser.readline()
        if ibuffer.decode('ascii').replace("\r\n","") =="OK":
            return ser
        else:
            raise_error_arduino()
    else:
        try:
	    ser = Serial(port = '/dev/ttyUSB0',baudrate = 9600, timeout=1)
        except:
            raise raise_error_arduino()
        time.sleep(2.5)
        ser.write('3'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
        ibuffer=ser.readline()
        if ibuffer.decode('ascii').replace("\r\n","") =="OK":
            return ser
        else:
            raise_error_arduino()


def get_coins():
        ser = get_arduino_connection()
	ser.flushInput()
	ser.write('1'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
	ibuffer=ser.readline()
        print(ibuffer)
	return round(int(ibuffer.decode('ascii'))*0.1,2)

def reset_coins():
        ser = get_arduino_connection()
	ser.write('2'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino

def arduino_thread(q_arduino_send, q_arduino_receive):
    switch_on_coin_acceptor()
    reset_coins()
    while True:
        data= q_arduino_send.get()
        if data == "get":
            q_arduino_receive.put(get_coins())
        elif data =="poweroff":
            reset_coins()
            switch_off_coin_acceptor()
        q_arduino_send.task_done()



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
    global q_arduino_receive
    global q_arduino_send
    printLCD("Goodbye !")
    switch_off_coin_acceptor()
    q_email.join()
    q_log.join()
    q_lcd.join()
    q_arduino_receive.join()
    q_arduino_send.join()
    sys.exit(0)

def leave_program():
    validate_transfert()
    stop()

def handler_child_transfert_validation(signum, frame):
    leave_program()

def validate_transfert():
    url=baseURL+"/money-flows/coinAcceptor"
    payload={ "value": total_coins, "description": "recharge par machine a  jetons", "coinAuthentifier": 987, "accountId": accountId}
    if total_coins!=0:
        printLCD("WAIT FOR~VALIDATION")
        try:
            r = requests.post(url=url, data=json.dumps(payload), headers=headers)
            tokenRetour = json.loads(r.content)
        except requests.exceptions.RequestException as e:
            email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi photomaton n'ait pas reussi a envoyer la requete au serveur lui permettant de  valider l'ajout de sous avec l accepteur de pieces..
Le probleme a eu lieu pour l'utilisateur %s a %s.
Resume de l'exception : %s
Resume du transfert : %s
                """%(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), e, payload)
            subject="Erreur de validation d ajout de pieces a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            write_log("server", e)
            send_email(subject, email)
            stop()
        print(tokenRetour)
        printLCD("CREDIT ADDED~"+str(total_coins)+"euro")
        time.sleep(m_timeout*3)
    else:
        printLCD("NO CREDIT")
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

def transfert():
    global total_coins
    time.sleep(m_timeout)
    printLCD("INSERT COINS")
    old = 0.0
    new =0.0
    lastpulse=datetime.now()
    while True:
    	old=new
    	new = send_get_arduino()
        total_coins = new
    	if old != new:
    		lastpulse = datetime.now()
    		printLCD(str(new)+"euro")
    	elapsed = datetime.now() -lastpulse
    	if elapsed > timedelta(seconds=tMax) :
                send_poweroff_arduino()
        	leave_program()
    	time.sleep(maxCoinTime)

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
Il semblerait que le raspberry pi photomaton n'ait pas reussi a envoyer la requete au serveur pour authentifier un utilisateur avec sa carte rfid.
Il s'agit d'un probleme majeur, le serveur etant connecte en local. Il doit s'agir d'une surchauffe du raspberry pi bar ou d'une erreur reseau.
Pour resoudre le probleme, il faudrait le redemarrer au moyen du boutton rouge du domino.
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
        printLCD("Welcome~"+uName)
        time.sleep(m_timeout)
        printLCD("Balance :~"+current_money+"euro")
        time.sleep(m_timeout)
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
        elif data[0]=="server":
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

def send_get_arduino():
    global q_arduino_send
    global q_arduino_receive
    q_arduino_send.put("get")
    coin = q_arduino_receive.get()
    q_arduino_receive.task_done()
    return coin

def send_poweroff_arduino():
    global q_arduino_send
    q_arduino_send.put("poweroff")

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
    global q_arduino_send
    global q_arduino_receive
    global p1
    global p2
    global p3
    signal.signal(signal.SIGINT, sigint_handler)
    q_email= Queue()
    q_lcd= Queue()
    q_log= Queue()
    q_arduino_send= Queue()
    q_arduino_receive= Queue()
    p1=Thread(target=email_thread, args=(q_email,))
    p2=Thread(target=LCD_thread, args=(q_lcd,))
    p3=Thread(target=log_thread, args=(q_log,))
    p4=Thread(target=arduino_thread, args=(q_arduino_send, q_arduino_receive,))
    p1.setDaemon(True)
    p2.setDaemon(True)
    p3.setDaemon(True)
    p4.setDaemon(True)
    p1.start()
    p2.start()
    p3.start()
    p4.start()
    auth()
    transfert()
main()

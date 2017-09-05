#!/usr/bin/python2
import  re, math, sys, time, signal, requests, json, os, time, paramiko, smtplib
import RPi.GPIO as GPIO
from datetime import datetime
from display import printLCD as pLCD
from Queue import Queue
from threading import Thread
import thread
from dateutil import parser

products ={}
tMax=30 # temps commande max
serverIP="127.0.0.1"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
currentDir="/home/pi/RFID_C/"
uName="NO AUTHENTICATION YET"
hostnameCam = "192.168.0.214"
passwordCam = "Livrogn9"
usernameCam = "pi"
portCam = 22
port_GPIO_BUTTON=18
port_GPIO_LIGHT_BUTTON=20
port_GPIO_FRIGO_LOCK=19
m_timeout=1.5
delayBeforeOrder=10
ssh=None
paramiko.util.log_to_file(currentDir+"logs/ssh_paramiko.log")

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
        
        

def openSSH():
    global ssh
    try:
        if ssh == None or not ssh.get_transport().is_active():
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
            ssh.load_system_host_keys()
            ssh.connect(hostnameCam, portCam, usernameCam, passwordCam, timeout=3)
            return True
    except:
        email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi bar n'arrive pas  acceder au raspberry pi en charge de l'encodage de la camera (192.168.0.214).
Les commandes sont toujours fonctionnelles, mais pour augmenter la securite, il serait bien de redemarrer le routeur Douglass.
Pour cela, il faut eteindre, puis rallumer le domino central (petit bouton rouge) de l'ivrogne. 
 Nom de l'utilisateur %s, arrive a %s. 
            """ %( uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        subject="Erreur de connexion au raspberry en charge de l'encodage video a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        write_log("cam","Erreur connexion ssh au raspberry pi cam")
        print("Sending email : Subject %s \n body : %s\n" %(subject, email))
        send_email(subject,email)
        return False


def exec_comm(command):
    global ssh
    try:
        (stdin, stdout, stderr) = ssh.exec_command(command)
        for line in stdout.readlines():
             print(line)
    except:
        write_log("cam","Erreur execution encodage cam via ssh");

def closeSSH():
    global ssh
    try:
        if ssh!= None and ssh.get_transport().is_active():
            ssh.close()
    except:
        write_log("cam","Erreur fermeture connexion ssh");

def start_encoding():
    if openSSH():
        print("order staring, starting cam encoding")
        exec_comm('/home/pi/auth_stream_to_avi.sh '+"_"+str(uId)+"_"+uName)

def stop_encoding():
    print("order finised, stoping cam encoding")
    openSSH()
    print("killing avconv")
    exec_comm("killall avconv")
    closeSSH()

def handler_barcode(signum, frame):
    raise IOError("No input on barcode scan")
    
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
    lightButtonOff()
    closeFrigo()
    validate_order() 
    stop_encoding()
    stop()
def handler_child_leave_order(signum, frame):
    signal.signal(signal.SIGUSR1, signal.SIG_IGN)
    leave_program()


def handler_child_enter_order(signum, frame):
    signal.signal(signal.SIGUSR1, signal.SIG_IGN)
    start_encoding()
    lightButtonOn()
    openFrigo()
    printLCD("ORDER STARTED")
    order()

def lecture_barcode(timeout):
	hid = { 4: 'a', 5: 'b', 6: 'c', 7: 'd', 8: 'e', 9: 'f', 10: 'g', 11: 'h', 12: 'i', 13: 'j', 14: 'k', 15: 'l', 16: 'm', 17: 'n', 18: 'o', 19: 'p', 20: 'q', 21: 'r', 22: 's', 23: 't', 24: 'u', 25: 'v', 26: 'w', 27: 'x', 28: 'y', 29: 'z', 30: '1', 31: '2', 32: '3', 33: '4', 34: '5', 35: '6', 36: '7', 37: '8', 38: '9', 39: '0', 44: ' ', 45: '-', 46: '=', 47: '[', 48: ']', 49: '\\', 51: ';' , 52: '\'', 53: '~', 54: ',', 55: '.', 56: '/'  }

	hid2 = { 4: 'A', 5: 'B', 6: 'C', 7: 'D', 8: 'E', 9: 'F', 10: 'G', 11: 'H', 12: 'I', 13: 'J', 14: 'K', 15: 'L', 16: 'M', 17: 'N', 18: 'O', 19: 'P', 20: 'Q', 21: 'R', 22: 'S', 23: 'T', 24: 'U', 25: 'V', 26: 'W', 27: 'X', 28: 'Y', 29: 'Z', 30: '!', 31: '@', 32: '#', 33: '$', 34: '%', 35: '^', 36: '&', 37: '*', 38: '(', 39: ')', 44: ' ', 45: '_', 46: '+', 47: '{', 48: '}', 49: '|', 51: ':' , 52: '"', 53: '~', 54: '<', 55: '>', 56: '?'  }

        try:
	    fp = open('/dev/hidraw0', 'rb')
        except Exception as e:
            email="""
Bonjour chers Administrateurs, 
Il semblerait que la scanette usb n est pas connectee au raspberry.
Veuillez la rebrancher le plus rapidemenent possible.
Nom de l'utilisateur %s , arrive a %s
 Resume de l'exception : %s
                """%(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"),repr(e))
            print(e)
            subject="Erreur scanette usb non branchee a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            send_email(subject, email)
            write_log("scan", e)
            stop()
	ss = ""
	shift = False
	done = False
	while done==False:
		signal.signal(signal.SIGALRM, handler_barcode)
		signal.alarm(timeout)
		buffer = fp.read(8)
		for c in buffer:
			if ord(c) > 0:
         			if int(ord(c)) == 40:
            				done = True
            				break;
         			if shift: 
           		 		if int(ord(c)) == 2 :
               					shift = True
            				else:
               					ss += hid2[ int(ord(c)) ]
               					shift = False
         			else:
            				if int(ord(c)) == 2 :
               					shift = True
            				else:
               					ss += hid[int(ord(c))]
	fp.close()
	return ss

def count_items(products):
    total = 0
    for key in products:
        total+=products[key][0]
    return total

def lightButtonOn():
    print("lightbuttonoff")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.LOW)

def lightButtonOff():
    print("lightbuttonoff")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.HIGH)

def openFrigo():
    print("openfrigo")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_FRIGO_LOCK, GPIO.OUT)
    GPIO.output(port_GPIO_FRIGO_LOCK, GPIO.LOW)

def closeFrigo():
    print("closefrigo")
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_FRIGO_LOCK, GPIO.OUT)
    GPIO.output(port_GPIO_FRIGO_LOCK, GPIO.HIGH)

def validate_order():
    orderlines=[]
    for key in products:
        orderlines.append({"product":key, "quantity" :products[key][0]})
    payload={ "orderlines": orderlines}
    if role!="ROLE_BARMAN":
        url = baseURL+'/orders/client-self-order'
    else:
        url = baseURL+'/admin/orders/cash'
        printLCD("ORDER IN CASH")
        time.sleep(m_timeout)
    if orderlines:
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
        if "INSUFFICIENT_CASH" in tokenRetour:
            printLCD("NOT ENOUGH CASH~TOTAL:"+str(tokenRetour["order_total"])+"E")
            time.sleep(m_timeout)
            printLCD("CUR.BALANCE:"+str(tokenRetour["balance"])+"E~MONEY LIM.:"+str(tokenRetour["money_limit"])+"E")
            time.sleep(m_timeout)
            email="""
Bonjour chers Administrateurs,
Il semblerait qu'un utilisateur n'ait pas un solde suffisant pour payer sa commande.
Son solde est de %s et le montant  de sa commande est de %s.
Veuillez faire venir un administrateur au bar le plus rapidement possible pour lui demander de remettre (amicalement) les produits dans le frigo. Nom de l'utilisateur %s, arrive a %s. 
            """ %(str(tokenRetour["balance"]), str(tokenRetour["order_total"]), uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            subject="Solde insuffisant a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            send_email(subject,email)
            return
        else:
            print(tokenRetour)
            printLCD("ORDER VALIDATED~TOTAL:"+str(tokenRetour["order_price"])+"euro")
            time.sleep(m_timeout*2)
    else:
        printLCD("NO PRODUCT")
        time.sleep(m_timeout)

def listen_button():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    while True:
        input_state = GPIO.input(port_GPIO_BUTTON)
        if input_state == False:
           os.kill(os.getpid(), signal.SIGUSR1)
           print('Button Pressed')
           time.sleep(0.5)
        time.sleep(0.05)

def order():
    global products
    signal.signal(signal.SIGUSR1, handler_child_leave_order)
    t_end = time.time() + tMax 
    while t_end > time.time() :
        try:
            barcode=lecture_barcode(int(round(t_end -time.time())))
            print(barcode)
        except IOError as e:
            print( "IOERROR Barcode")
            write_log("scan", e)
            break
        url = baseURL+'/products/'+barcode
        try:
            r =  requests.get(url, headers=headers)
            tokenVerif = json.loads(r.content)
        except requests.exceptions.RequestException as e:
            write_log("server", e)
            printLCD("ERREUR seveur") 
            time.sleep(m_timeout*2)
            email="""
Bonjour chers Administrateurs,
Il semblerait que le raspberry pi bar n'arrive pas a determiner le prix d'un produit.
Il n'arrive pas a acceder  a l'adresse %s. Il y a de grandes chances que cela provienne d'une surchauffe du raspberry (celui-ci etant connecte au serveur en local). 
Il vous est conseille de redemarrer le raspberry le plus rapidement possible (boutton rouge domino).
Le probleme a eu lieu en %s pour l'utilisateur %s.
Resume de l'exception : %s
                    """ %(url, uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), e)
            subject="Erreur de connexion detectee a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
            send_email(subject,email)
            stop()
        if "message" not in tokenVerif: #si barcode valide	
            if barcode not in products:
                products[barcode]=[1, tokenVerif["name"]]
            else:
                products[barcode][0]+=1
            printLCD(products[barcode][1][:13]+"X"+str(products[barcode][0])+"~Amount items:"+str(count_items(products)))
        else :
            print( barcode +" :  codebarre non reconnu !")
            printLCD(barcode[:15]+":~NOT AVAILABLE")
            email ="""
Bonjour chers Administrateurs,
Il semblerait qu'un produit n'ait pas ete reconnu par le systeme.
Il peut s'agir dans la plupart des cas d'une petite corruption a la lecture du codebarre (due a la qualite du lecteur).
Il pourrait egalement s'agir d'un produit qui a ete scanne, mais qui n'est pas present dans le systeme.
Merci, de faire venir un admin pres du bar pour verifier que cela ne soit pas le cas.
Le probleme a eu lieu en %s pour l'utilisateur %s.
Code barre : %s
                 """ %(uName, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), str(barcode))
    leave_program()

def auth():
    global headers
    global uAccount
    global uName
    global uId
    global role
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
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}

def enter_order():
    signal.signal(signal.SIGUSR1, handler_child_enter_order)
    t_left=0
    t_end = time.time() + delayBeforeOrder
    while t_end > time.time() :
        printLCD("Welcome !~"+uName)
        t_left=int(round(t_end-time.time()))
        time.sleep(m_timeout)
        if t_left > 0 :
            printLCD("TIME LEFT:~"+str(t_left)+" sec")
            time.sleep(m_timeout)
    stop()

def log_thread(q_log):
    log_cam_f = open(currentDir+"logs/cam.log","a")
    log_lcd_f = open(currentDir+"logs/lcd.log","a")
    log_server_f = open(currentDir+"logs/server.log","a")
    log_email_f = open(currentDir+"logs/email.log","a")
    log_scan_f = open(currentDir+"logs/scan.log","a")
    while True:
        data = q_log.get()
        message = uName+" at "+datetime.now().strftime("%Y-%m-%d %H:%M:%S")+" : "+str(data[1])+"\n"
        print(data[0]+" : "+message)
        if data[0]=="cam":
            log_cam_f.write(message)
        elif data[0]=="lcd":
            log_lcd_f.write(message)
        elif data[0]=="server":
            log_server_f.write(message)
        elif data[0]=="email":
            log_email_f.write(message)
        elif data[0]=="scan":
            log_scan_f.write(message)
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
    p4=Thread(target=listen_button)
    p1.setDaemon(True)
    p2.setDaemon(True)
    p3.setDaemon(True)
    p4.setDaemon(True)
    p1.start()
    p2.start()
    p3.start()
    auth()
    p4.start()
    enter_order()
main()

#!/usr/bin/python
import re, math, sys, threading, time, signal, requests, json, os, time, psutil, paramiko
import RPi.GPIO as GPIO
from dateutil import parser
from datetime import datetime
from display import printLCD as pLCD
products ={}
tMax=30 # temps commande max
serverIP="192.168.0.210"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
currentDir="/home/pi/RFID_C"
uName="NO AUTHENTICATION YET"
hostnameCam = "192.168.0.214"
passwordCam = "Livrogn9"
usernameCam = "pi"
portCam = 22
delayBeforeOrder=5
port_GPIO_BUTTON=18
port_GPIO_LIGHT_BUTTON=20
port_GPIO_FRIGO_LOCK=19
listen_button_pid=0
ssh=None

def openSSH():
    global ssh
    try:
        if ssh == None or not ssh.get_transport().is_active():
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
            ssh.load_system_host_keys()
            ssh.connect(hostnameCam, portCam, usernameCam, passwordCam)
    except:
        printLCD("ERREUR MINEURE:~CAM SSH")
        time.sleep(2)

def exec_comm(command):
    global ssh
    try:
        (stdin, stdout, stderr) = ssh.exec_command(command)
        for line in stdout.readlines():
             print line
    except:
        printLCD("ERREUR MINEURE:~CAM SSH")
        time.sleep(2)

def closeSSH():
    global ssh
    try:
        if ssh!= None and ssh.get_transport().is_active():
            ssh.close()
    except:
        printLCD("ERREUR MINEURE:~CAM SSH")
        time.sleep(2)

def start_encoding():
    print("order staring, starting cam encoding")
    openSSH()
    exec_comm('/home/pi/auth_stream_to_avi.sh '+"_"+str(uId)+"_"+uName)

def stop_encoding():
    print("order finised, stoping cam encoding")
    openSSH()
    exec_comm("killall avconv")
    closeSSH()

def handler_barcode(signum, frame):
    raise IOError("No input on barcode scan")

def early_leave_program():
    try:
        os.kill(listen_button_pid, signal.SIGTERM)
    except:
        print("kill d'un process child inexistant (listen_button)")
    os.wait()
    printLCD("SEE YOU~NEXT TIME")
    time.sleep(2)
    sys.exit(0)
    
def leave_program():
    printLCD("WAIT FOR~VALIDATION...")
    os.kill(listen_button_pid, signal.SIGTERM)
    os.wait()
    lightButtonOff()
    closeFrigo()
    validate_order() 
    stop_encoding()
    printLCD("ORDER FINISHED")
    time.sleep(1.5) 
    sys.exit(0)

def handler_child_leave_order(signum, frame):
    leave_program()

def handler_child_enter_order(signum, frame):
    os.kill(listen_button_pid, signal.SIGTERM)
    cam_pid = os.fork()
    if cam_pid == 0:
        start_encoding()
        sys.exit(0)
    else:
        printLCD("ORDER STARTED")
        lightButtonOn()
        openFrigo()
        order()

def printLCD(string):
    print(string)
    with open (currentDir+"/rfid.log", "a") as f:
        f.write(uName+" at "+datetime.now().strftime("%Y-%m-%d %H:%M:%S")+" : "+string+"\n")
    try:
        pLCD(string)
    except:
        print("CORRUPTION LCD DETECTE")
     #   exit(1)


def lectureBarcode(timeout):
	hid = { 4: 'a', 5: 'b', 6: 'c', 7: 'd', 8: 'e', 9: 'f', 10: 'g', 11: 'h', 12: 'i', 13: 'j', 14: 'k', 15: 'l', 16: 'm', 17: 'n', 18: 'o', 19: 'p', 20: 'q', 21: 'r', 22: 's', 23: 't', 24: 'u', 25: 'v', 26: 'w', 27: 'x', 28: 'y', 29: 'z', 30: '1', 31: '2', 32: '3', 33: '4', 34: '5', 35: '6', 36: '7', 37: '8', 38: '9', 39: '0', 44: ' ', 45: '-', 46: '=', 47: '[', 48: ']', 49: '\\', 51: ';' , 52: '\'', 53: '~', 54: ',', 55: '.', 56: '/'  }

	hid2 = { 4: 'A', 5: 'B', 6: 'C', 7: 'D', 8: 'E', 9: 'F', 10: 'G', 11: 'H', 12: 'I', 13: 'J', 14: 'K', 15: 'L', 16: 'M', 17: 'N', 18: 'O', 19: 'P', 20: 'Q', 21: 'R', 22: 'S', 23: 'T', 24: 'U', 25: 'V', 26: 'W', 27: 'X', 28: 'Y', 29: 'Z', 30: '!', 31: '@', 32: '#', 33: '$', 34: '%', 35: '^', 36: '&', 37: '*', 38: '(', 39: ')', 44: ' ', 45: '_', 46: '+', 47: '{', 48: '}', 49: '|', 51: ':' , 52: '"', 53: '~', 54: '<', 55: '>', 56: '?'  }

	fp = open('/dev/hidraw0', 'rb')
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
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.LOW)

def lightButtonOff():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_LIGHT_BUTTON, GPIO.OUT)
    GPIO.output(port_GPIO_LIGHT_BUTTON, GPIO.HIGH)

def openFrigo():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_FRIGO_LOCK, GPIO.OUT)
    GPIO.output(port_GPIO_FRIGO_LOCK, GPIO.LOW)

def closeFrigo():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_FRIGO_LOCK, GPIO.OUT)
    GPIO.output(port_GPIO_FRIGO_LOCK, GPIO.HIGH)

def validate_order():
    orderlines=[]
    try:
	for key in products:
		orderlines.append({"product":key, "quantity" :products[key][0]})
	payload={"order":{"customerUserAccount":uAccount}, "orderlines": orderlines}
        url = baseURL+'/client-self-order'
    except IOError:
	for key in barcodes:
		orderlines.append({"product":key, "quantity" :products[key][0]})
		payload={"order":{"customerUserAccount":uAccount}, "orderlines": orderlines}
                url = baseURL+'/client-self-order'
	if orderlines:
		r = requests.post(url=url, data=json.dumps(payload), headers=headers)
		tokenRetour = json.loads(r.content)
                if "INSUFFICIENT_CASH" in tokenRetour:
                    printLCD("NOT ENOUGH CASH~TOTAL:"+str(tokenRetour["order_total"]))
                    time.sleep(2)
                    printLCD("CUR.BALANCE:"+str(tokenRetour["balance"])+"EU.~MONEY LIM.:"+str(tokenRetour["money_limit"])+"Eu.")
                    time.sleep(2)
                    return
    if orderlines:
        r = requests.post(url=url, data=json.dumps(payload), headers=headers)
        tokenRetour = json.loads(r.content)
        if "INSUFFICIENT_CASH" in tokenRetour:
            printLCD("NOT ENOUGH CASH~TOTAL:"+str(tokenRetour["order_total"]))
            time.sleep(2)
            printLCD("CUR.BALANCE:"+str(tokenRetour["balance"])+"EU.~MONEY LIM.:"+str(tokenRetour["money_limit"])+"Eu.")
            time.sleep(2)
            return
            

def listen_button():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    while True:
        time.sleep(0.01)
        input_state = GPIO.input(port_GPIO_BUTTON)
        if input_state == False:
           print('Button Pressed')
           time.sleep(1)
           os.kill(os.getppid(), signal.SIGUSR1)
           exit(0)
def order():
    global products
    global listen_button_pid
    signal.signal(signal.SIGUSR1, handler_child_leave_order)
    listen_button_pid =os.fork()
    if listen_button_pid ==0:
       listen_button()
    t_end = time.time() + tMax 
    while t_end > time.time() :
	try:
	    barcode=lectureBarcode(int(round(t_end -time.time())))
	    print barcode
	    url = baseURL+'/products/'+barcode
	    r =  requests.get(url, headers=headers)
	    tokenVerif = json.loads(r.content)
	    if "message" not in tokenVerif: #si barcode valide	
	        if barcode not in products:
                    products[barcode]=[1, tokenVerif["name"]]
		else:
		    products[barcode][0]+=1
                printLCD(products[barcode][1][:13]+"X"+str(products[barcode][0])+"~Amount items:"+str(count_items(products)))
            else :
                print barcode +" :  codebarre non reconnu !"
                printLCD(barcode[:15]+":~NOT AVAILABLE")
	except IOError:
                print "IOERROR"
		break
    leave_program()

def auth():
    global headers
    global uAccount
    global uName
    global uId
    uid = sys.argv[1]
    url=baseURL+"/rfid-auth-tokens"
    data={"card_id":uid}
    r=requests.post(url=url, data=json.dumps(data))
    tokenPyth=json.loads(r.content)
    if "value" not in tokenPyth:
        printLCD("CARD NOT IN~THE SYSTEM!")
        exit(0)
    for ac in tokenPyth["user"]["user_accounts"]:
	if ac["type"] == "somebody":
	    uAccount=ac["id"]
    print(tokenPyth)
    tokenTemp=tokenPyth["value"]
    token = tokenTemp[1][1:len(tokenTemp[1])-1]
    token = tokenTemp.replace("\\", "")
    uName=tokenPyth["user"]["firstname"]+"_"+tokenPyth["user"]["lastname"]
    uName.replace("\ ","")
    uName=uName[:15]
    uId=tokenPyth["user"]["id"]
    printLCD(uName+":~Authenticated !")
    time.sleep(0.5)
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}

def enter_order():
    global listen_button_pid
    signal.signal(signal.SIGUSR1, handler_child_enter_order)
    listen_button_pid = os.fork()
    if listen_button_pid ==0:
       listen_button()
    else:
        for i in range(0, delayBeforeOrder):
            printLCD("TO START ORDER~PRESS BUTTON")
            time.sleep(0.5)
            printLCD("TIME LEFT:~"+str(delayBeforeOrder-i)+" sec")
            time.sleep(0.5)
        early_leave_program()

def main():
    auth()
    enter_order()
    order()
		
main()

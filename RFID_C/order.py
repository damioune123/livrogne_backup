#!/usr/bin/python
import re, math, sys, time, signal, requests, json, os, time, psutil, paramiko
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
port_GPIO_BUTTON=18
port_GPIO_LIGHT_BUTTON=20
port_GPIO_FRIGO_LOCK=19
listen_button_pid=0
pidLCD=0
m_timeout=2
delayBeforeOrder=10
ssh=None
#fo_cam_r, fo_cam_w = None, None
paramiko.util.log_to_file("ssh_paramiko.log")
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
        print("ERREUR MINEURE:~CAM SSH")
        return False


def exec_comm(command):
    global ssh
    try:
        (stdin, stdout, stderr) = ssh.exec_command(command)
        for line in stdout.readlines():
             print line
    except:
        print("Erreur exec ssh")

def closeSSH():
    global ssh
    try:
        if ssh!= None and ssh.get_transport().is_active():
            ssh.close()
    except:
        print("Erreur close ssh")

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
    
def leave_program():
    global fo_cam_r
    global fo_cam_w
    printLCD("WAIT FOR~VALIDATION")
    lightButtonOff()
    closeFrigo()
    validate_order() 
    stop_encoding()
    os.kill(listen_button_pid, signal.SIGTERM)
    os.kill(pidLCD, signal.SIGTERM)
    printLCD("GOODBYE !")
    time.sleep(m_timeout)
    sys.exit(0)

def handler_child_leave_order(signum, frame):
    leave_program()

def handler_child_enter_order(signum, frame):
    printLCD("ORDER NOT READY")
    start_encoding()
    lightButtonOn()
    openFrigo()
    printLCD("ORDER STARTED")
    order()

def logLCD(string):
    print(string)
    with open (currentDir+"/rfid.log", "a") as f:
        f.write(uName+" at "+datetime.now().strftime("%Y-%m-%d %H:%M:%S")+" : "+string+"\n")

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
    time.sleep(m_timeout)
    for key in products:
        orderlines.append({"product":key, "quantity" :products[key][0]})
    payload={"order":{"customerUserAccount":uAccount}, "orderlines": orderlines}
    url = baseURL+'/client-self-order'
    if orderlines:
        r = requests.post(url=url, data=json.dumps(payload), headers=headers)
        tokenRetour = json.loads(r.content)
        if "INSUFFICIENT_CASH" in tokenRetour:
            printLCD("NOT ENOUGH CASH~TOTAL:"+str(tokenRetour["order_total"])+"E")
            time.sleep(m_timeout)
            printLCD("CUR.BALANCE:"+str(tokenRetour["balance"])+"E~MONEY LIM.:"+str(tokenRetour["money_limit"])+"E")
            time.sleep(m_timeout)
            return
        else:
            printLCD("ORDER VALIDATED~TOTAL:"+str(tokenRetour["order_price"])+"euro")
            time.sleep(m_timeout)

def listen_button():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(port_GPIO_BUTTON, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    while True:
        time.sleep(0.02)
        input_state = GPIO.input(port_GPIO_BUTTON)
        if input_state == False:
           os.kill(os.getppid(), signal.SIGUSR1)
           print('Button Pressed')
           sys.exit(0)
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
                print "IOERROR Barcode"
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
        time.sleep(m_timeout)
        sys.exit(0)
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
    printLCD("Welcome !~"+uName)
    time.sleep(m_timeout)
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}

def enter_order():
    global listen_button_pid
    t_left=0
    signal.signal(signal.SIGUSR1, handler_child_enter_order)
    listen_button_pid = os.fork()
    if listen_button_pid ==0:
       listen_button()
    t_end = time.time() + delayBeforeOrder
    while t_end > time.time() :
        printLCD("TO START ORDER~PRESS BUTTON")
        time.sleep(m_timeout)
        t_left=int(round(t_end-time.time()))
        if t_left > 0 :
            printLCD("TIME LEFT:~"+str(t_left)+" sec")
            time.sleep(m_timeout)
    os.kill(listen_button_pid, signal.SIGTERM)
    os.kill(pidLCD, signal.SIGTERM)
    sys.exit(0)

def LCDProcess():
    global fo_cam_r
    while 1:
        data=fo_cam_r.readline()
        if not data: break
        try:
            pLCD(data[:len(data)-1])
        except Exception as e:
            print("CORRUPTON LCD DETECTE")
            print(e)
            try:
                pLCD(data[:len(data)-1])
            except Exception as i:
                print("DOUBLE CORRUPTON LCD DETECTE")
                print(i)



def printLCD(string):
    global fo_cam_w
    try:
        fo_cam_w.write(str(string+"\n"))
        fo_cam_w.flush()
    except:
        print("Erreur pipe : "+string)
    

def main():
    global fo_cam_r
    global fo_cam_w
    global pidLCD
    rLCD, wLCD = os.pipe()
    pidLCD = os.fork()
    if pidLCD == 0:       
        os.close(wLCD)
        fo_cam_r = os.fdopen(rLCD)
        LCDProcess()
    else:          
        os.close(rLCD)
        fo_cam_w = os.fdopen(wLCD, 'w')
        auth()
        enter_order()
        order()
		
main()

#!/usr/bin/python
import re, math, sys, threading, time, signal, requests, json, os, time
import RPi.GPIO as GPIO
from dateutil import parser
from datetime import datetime
from display import printLCD
products ={}
tMax=120 # temps commande max
baseURL="http://192.168.0.210/ivrogne_api_raspberry/web/app.php/api"

def handler(signum, frame):
    raise IOError("No input on barcode scan")

def handler_child(signum, frame):
    validate_order()
    exit(0)

def lectureBarcode(timeout):
	hid = { 4: 'a', 5: 'b', 6: 'c', 7: 'd', 8: 'e', 9: 'f', 10: 'g', 11: 'h', 12: 'i', 13: 'j', 14: 'k', 15: 'l', 16: 'm', 17: 'n', 18: 'o', 19: 'p', 20: 'q', 21: 'r', 22: 's', 23: 't', 24: 'u', 25: 'v', 26: 'w', 27: 'x', 28: 'y', 29: 'z', 30: '1', 31: '2', 32: '3', 33: '4', 34: '5', 35: '6', 36: '7', 37: '8', 38: '9', 39: '0', 44: ' ', 45: '-', 46: '=', 47: '[', 48: ']', 49: '\\', 51: ';' , 52: '\'', 53: '~', 54: ',', 55: '.', 56: '/'  }

	hid2 = { 4: 'A', 5: 'B', 6: 'C', 7: 'D', 8: 'E', 9: 'F', 10: 'G', 11: 'H', 12: 'I', 13: 'J', 14: 'K', 15: 'L', 16: 'M', 17: 'N', 18: 'O', 19: 'P', 20: 'Q', 21: 'R', 22: 'S', 23: 'T', 24: 'U', 25: 'V', 26: 'W', 27: 'X', 28: 'Y', 29: 'Z', 30: '!', 31: '@', 32: '#', 33: '$', 34: '%', 35: '^', 36: '&', 37: '*', 38: '(', 39: ')', 44: ' ', 45: '_', 46: '+', 47: '{', 48: '}', 49: '|', 51: ':' , 52: '"', 53: '~', 54: '<', 55: '>', 56: '?'  }

	fp = open('/dev/hidraw0', 'rb')
	ss = ""
	shift = False
	done = False
	while done==False:
		signal.signal(signal.SIGALRM, handler)
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

def validate_order():
    global products
    global headers
    global uAccount
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
                printLCD("TOTAL:~"+str(tokenRetour["order_price"])+"euro")
                time.sleep(5)
    if orderlines:
        r = requests.post(url=url, data=json.dumps(payload), headers=headers)
        tokenRetour = json.loads(r.content)
        printLCD("TOTAL:~"+str(tokenRetour["order_price"])+"euro")
    time.sleep(5)

def listen_button():
    GPIO.setmode(GPIO.BCM)
    port=18
    GPIO.setup(port, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    while True:
        time.sleep(0.5)
        input_state = GPIO.input(port)
        if input_state == False:
           print('Button Pressed')
           os.kill(os.getppid(), signal.SIGUSR1)
           exit(0)

def main():
    global tMax
    global products
    global headers
    global uAccount
    with open("token.txt","r") as f:
    	tokenPayload=f.read();
    m=re.search("user_accounts", tokenPayload);
    if m==None:
    	exit(0)
    signal.signal(signal.SIGUSR1, handler_child)
    newpid = os.fork()
    if newpid ==0:
       listen_button()
    tokenPyth =json.loads(tokenPayload)
    for ac in tokenPyth["user"]["user_accounts"]:
	if ac["type"] == "somebody":
	    uAccount=ac["id"]
    tokenTemp=tokenPyth["value"]
    token = tokenTemp[1][1:len(tokenTemp[1])-1]
    token = tokenTemp.replace("\\", "")
    firstname=tokenPyth["user"]["firstname"]
    printLCD(firstname[:15]+":~Authenticated_!")
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}
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
                printLCD(products[barcode][1][:13]+"X"+str(products[barcode][0])+"~Amount_items:"+str(count_items(products)))
            else :
                print barcode +" :  codebarre non reconnu !"
                printLCD(barcode[:15]+":~NOT_AVAILABLE")
	except IOError:
                print "IOERROR"
		break
    validate_order()
    sys.exit(0)
		
main()
		


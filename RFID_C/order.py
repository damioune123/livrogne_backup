#!/usr/bin/python
import re
import math
import sys
import threading
import time
import signal
import requests
import json

tMax=15 # temps commande max
token=None

def lectureBarcode(timeout):
	hid = { 4: 'a', 5: 'b', 6: 'c', 7: 'd', 8: 'e', 9: 'f', 10: 'g', 11: 'h', 12: 'i', 13: 'j', 14: 'k', 15: 'l', 16: 'm', 17: 'n', 18: 'o', 19: 'p', 20: 'q', 21: 'r', 22: 's', 23: 't', 24: 'u', 25: 'v', 26: 'w', 27: 'x', 28: 'y', 29: 'z', 30: '1', 31: '2', 32: '3', 33: '4', 34: '5', 35: '6', 36: '7', 37: '8', 38: '9', 39: '0', 44: ' ', 45: '-', 46: '=', 47: '[', 48: ']', 49: '\\', 51: ';' , 52: '\'', 53: '~', 54: ',', 55: '.', 56: '/'  }

	hid2 = { 4: 'A', 5: 'B', 6: 'C', 7: 'D', 8: 'E', 9: 'F', 10: 'G', 11: 'H', 12: 'I', 13: 'J', 14: 'K', 15: 'L', 16: 'M', 17: 'N', 18: 'O', 19: 'P', 20: 'Q', 21: 'R', 22: 'S', 23: 'T', 24: 'U', 25: 'V', 26: 'W', 27: 'X', 28: 'Y', 29: 'Z', 30: '!', 31: '@', 32: '#', 33: '$', 34: '%', 35: '^', 36: '&', 37: '*', 38: '(', 39: ')', 44: ' ', 45: '_', 46: '+', 47: '{', 48: '}', 49: '|', 51: ':' , 52: '"', 53: '~', 54: '<', 55: '>', 56: '?'  }

	fp = open('/dev/hidraw0', 'rb')
	ss = ""
	shift = False
	done = False
	def handler(signum, frame):
		print 'Signal handler called with signal', signum
		raise IOError("No input on barcode scan")

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

with open("token.txt","r") as f:
	token=f.read();
m=re.search("user_accounts", token);
if m==None:
	exit(0)
words = re.split(",", token)
print(words)
tokenTemp=re.split(":",words[1])
token = tokenTemp[1][1:len(tokenTemp[1])-1]
print("1qsdqsdqsds",token)
token = token.replace("\\", "")

print("qsdqsd", token)
firstNameTemp=re.split(":", words[4])
firstName=firstNameTemp[1][1:len(firstNameTemp[1])-1]
print(firstName)

uAccountTemp= re.split(":", words[8])
uAccount = uAccountTemp[2][:len(uAccountTemp[2])-1]

t_end = time.time() + tMax 
 
barcodes={}
while t_end > time.time() :
	try:
		barcode=lectureBarcode(int(round(t_end -time.time())))
	except IOError:
		break
	
	print barcode
	if barcode not in barcodes:
		barcodes[barcode]=1
	else:
		barcodes[barcode]+=1
print barcodes
orderlines=[]
for key in barcodes:
	orderlines.append({"product":key, "quantity" :barcodes[key]})
payload={"order":{"customerUserAccount":uAccount}, "orderlines": orderlines}
url = 'http://localhost/ivrogne_api_raspberry/web/app.php/api/client-self-order'
headers = {
	"X-Auth-Token": token,
	"Content-Type": "application/json",
}
print(json.dumps(payload))
if orderlines:
	r = requests.post(url, data=json.dumps(payload), headers=headers)
	print(r.content)
print("fini!")


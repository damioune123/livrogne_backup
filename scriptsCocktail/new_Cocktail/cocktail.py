#!/usr/bin/python3
import  sys
import RPi.GPIO as GPIO
from client import Client
pompe = None
cl = None
buf = None
if(len(sys.argv) ==1):
	print("Usage : "+sys.argv[0]+"service/clean pumpNum [(nombre_cl)]")
if sys.argv[1] == "service":
	if(len(sys.argv)!=4):
		print("Usage : "+sys.argv[0]+" service/clean pumpNum Num(nombre_cl)")
	else:
		pompe = sys.argv[2]
		cl = sys.argv[3]
		buf= pompe+"-"+cl
elif sys.argv[1] == "clean":
	if(len(sys.argv)!=3):
		print("Usage : "+sys.argv[0]+" clean pumpNum")
	else:
		pompe=sys.argv[2]
		buf=pompe+"-"+10
else:
	print("Usage : "+sys.argv[0]+"service/clean pumpNum Num(nombre_cl)")
try:
	client1 = Client(buf)
	client1.start()
	client1.join()	
except KeyboardInterrupt:
	serversocket.close()
	GPIO.cleanup()

	



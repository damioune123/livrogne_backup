#!/usr/bin/python3
import  sys
import RPi.GPIO as GPIO
from client import Client

if len(sys.argv)!=3 :
	print("Usage : "+sys.argv[0]+" service/clean code")

else :	
	try:
		print(sys.argv[2])
		client1 = Client(sys.argv[2])
		client1.start()
		client1.join()	
	except KeyboardInterrupt:
		serversocket.close()
		GPIO.cleanup()
	finally:
		GPIO.cleanup()
	



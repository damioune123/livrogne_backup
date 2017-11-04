#!/usr/bin/python3
from  serial import Serial
import time, signal
from datetime import datetime, timedelta
maxCoinTime=1.5
try:
	ser = Serial('/dev/ttyUSB0',9600)
except:
	print("usb arduino non connecte")
	exit(1)
def handler_alarm_arduino(signum, frame):
    print("read arduino timeout")
    exit(1)
def test_connection():
	signal.signal(signal.SIGALRM, handler_alarm_arduino)
# Set the signal handler and a 5-second alarm
	if not ser.isOpen():
		return False
	ser.flushInput()
	ser.write('3'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
	signal.alarm(1)
	ibuffer=ser.readline()
	signal.signal(signal.SIGALRM, signal.SIG_IGN)
	return ibuffer.decode('ascii').replace("\r\n","") =="OK"


def get_coins():
	signal.signal(signal.SIGALRM, handler_alarm_arduino)
	ser.flushInput()
	ser.write('1'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
	signal.alarm(1)
	ibuffer=ser.readline()
	signal.signal(signal.SIGALRM, signal.SIG_IGN)
	return round(int(ibuffer.decode('ascii'))*0.1,2)
def reset_coins():
	ser.write('2'.encode('ascii')) # Convert the decimal number to ASCII then send it to the Arduino
if test_connection():
	print("Connexion avec le arduino réussie")
reset_coins()
old = 0.0
new =0.0
lastpulse=datetime.now()
quitable = False
while True:
	old=new
	new = get_coins()
	if old != new:
		lastpulse = datetime.now()
		print(new)
	elapsed = datetime.now() -lastpulse
	if elapsed > timedelta(seconds=30) :
		quitable=True
		exit(0)
	else:
		quitable=True
	time.sleep(maxCoinTime)

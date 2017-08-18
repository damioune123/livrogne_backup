#!/usr/bin/python
import RPi.GPIO as GPIO
import time, os

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

pinList = [5,6,12,13,17,19,20,21,23]

# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)
    time.sleep(0.2)
# main loop

os.system("/home/pi/scripts/LCDdisplay/displayC.py Goodbye!!!")
time.sleep(1)
os.system("/home/pi/scripts/LCDdisplay/displayC.py READY\ FOR\ ORDER")

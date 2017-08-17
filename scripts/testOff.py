#!/usr/bin/python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

#pinList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20, 21,22,23, 24,25,26]
pinList = [27]
 #loop through pins and set mode and state to 'low'



for i in pinList:
    print i
    time.sleep(5)
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)

 

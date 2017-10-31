#!/usr/bin/python
import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)

# init list with pin numbers
GPIO.setup(19, GPIO.IN, pull_up_down=GPIO.PUD_UP)
while True:
    if GPIO.input(19):
        print('Input was HIGH')
    else:
        print('Input was LOW')
    time.sleep(0.5)

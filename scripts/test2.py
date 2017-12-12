#!/usr/bin/env python

import RPi.GPIO as GPIO
import time, sys

FLOW_SENSOR = 14

GPIO.setmode(GPIO.BCM)
GPIO.setup(FLOW_SENSOR, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

global count
count = 0

def countPulse(channel):
   global count
   count = count+1
   print("pulses : "+str(count))
   print (str(count)+" ml")

GPIO.add_event_detect(FLOW_SENSOR, GPIO.RISING, callback=countPulse)

while True:
    try:
        time.sleep(0.1)
    except KeyboardInterrupt:
        print '\ncaught keyboard interrupt!, bye'
        GPIO.cleanup()
        sys.exit()

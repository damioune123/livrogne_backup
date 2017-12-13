#!/usr/bin/env python

import RPi.GPIO as GPIO
import time, sys

FLOW_SENSOR = 14

GPIO.setmode(GPIO.BCM)
GPIO.setup(FLOW_SENSOR, GPIO.IN, pull_up_down = GPIO.PUD_UP)

global count
count = 0
def lagrange(pulses):
    return 2.851763958*10**(-4)*pulses**(2) + 1.37165904 *pulses - 23.34097073

def countPulse(channel):
   global count
   count = count+1
   print("pulses : "+str(count))

GPIO.add_event_detect(FLOW_SENSOR, GPIO.FALLING, callback=countPulse)

while True:
    try:
        time.sleep(0.1)
    except KeyboardInterrupt:
        print '\ncaught keyboard interrupt!, bye'
        GPIO.cleanup()
        sys.exit()


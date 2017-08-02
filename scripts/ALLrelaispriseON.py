#!/usr/bin/python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

#pinList = [17, 27, 22, 23, 24, 12, 5, 6]
pinList=[23, 6, 5, 24, 17, 27, 12, 22]

# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)

# time to sleep between operations in the main loop

SleepTimeL = 1

# main loop

try:
  for i in pinList:
    GPIO.output(i, GPIO.LOW)
    print i
    time.sleep(SleepTimeL)

# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit "

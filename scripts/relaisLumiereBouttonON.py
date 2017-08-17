#!/usr/bin/python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

pinList = [20]
# loop through pins and set mode and state to 'low'
for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)
# time to sleep between operations in the main loop

SleepTimeL=2

# main loop
try:
  for i in pinList:
    GPIO.output(i, GPIO.LOW)
    print i
    time.sleep(SleepTimeL);  

# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit"

  # Reset GPIO settings
  GPIO.cleanup()


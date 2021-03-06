#!/usr/bin/python
import RPi.GPIO as GPIO
import time
GPIO.setwarnings(False) 
GPIO.setmode(GPIO.BCM)

# init list with pin numbers

pinList = [12]
# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)
for i in pinList:
    GPIO.output(i, GPIO.LOW)
# time to sleep between operations in the main loop

SleepTimeL=2

# main loop
try:
  for i in pinList:
    GPIO.output(i, GPIO.LOW)
    time.sleep(0.2)

# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit"

  # Reset GPIO settings
  GPIO.cleanup()


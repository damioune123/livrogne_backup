#!/usr/bin/python
import RPi.GPIO as GPIO
import time, os

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

#pinList = [17, 27, 22, 23, 24, 12, 5, 6]
pinList=[5, 6, 12,13, 17, 23,26, 27]

# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)

# time to sleep between operations in the main loop

SleepTimeL = 0.5

# main loop

try:
  for i in pinList:
    GPIO.output(i, GPIO.LOW)
    print i
    time.sleep(SleepTimeL)
  GPIO.setup(19, GPIO.OUT)
  GPIO.setup(20, GPIO.OUT)
  GPIO.output(19, GPIO.HIGH)
  GPIO.output(20, GPIO.HIGH)
  os.system("/home/pi/scripts/LCDdisplay/displayC.py Bar...allume!")
  time.sleep(1)
  os.system("/home/pi/scripts/LCDdisplay/displayC.py Welcome!!!")


# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit "

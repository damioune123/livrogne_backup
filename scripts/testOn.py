#!/usr/bin/python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

pinList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26, 27]

#pinList= [26]
# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)
# time to sleep between operations in the main loop

SleepTimeL=2
time.sleep(2)
print("starting loop")
# main loop
try:
  for i in pinList:
    print(i)
    GPIO.output(i, GPIO.LOW)
    time.sleep(SleepTimeL)
#  GPIO.setup(26, GPIO.OUT)
 # GPIO.output(26, GPIO.HIGH)

# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit"

  # Reset GPIO settings
  GPIO.cleanup()


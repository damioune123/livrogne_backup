#!/usr/bin/python
import RPi.GPIO as GPIO
import time, os

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

#pinList = [17, 27, 22, 23, 24, 12, 5, 6]
pinList=[ 6, 12, 13, 16, 19, 20, 21, 26]

# loop through pins and set mode and state to 'low'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)

# time to sleep between operations in the main loop

SleepTimeL=0.5

# main loop

try:
  for i in pinList:
    GPIO.output(i, GPIO.LOW)
    print i
    time.sleep(SleepTimeL)
#  GPIO.setup(19, GPIO.OUT)
#  GPIO.setup(20, GPIO.OUT)
#  GPIO.output(19, GPIO.HIGH)
#  GPIO.output(20, GPIO.HIGH)
  newpid= os.fork()
  os.system("killall mpg123")
  if newpid==0:
      os.system("mpg123 /home/pi/Music/cena_theme.mp3  &")
  else:
    os.system("/home/pi/scripts/LCDdisplay/displayC.py Bar...allume! &")
    time.sleep(1)
    os.system("/home/pi/scripts/LCDdisplay/displayC.py Welcome!!! &")


# End program cleanly with keyboard
except KeyboardInterrupt:
  print "  Quit "


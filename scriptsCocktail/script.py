#!/usr/bin/python
import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)

# init list with pin numbers

pinList = [28, 27, 26, 25, 24, 23, 22]

# loop through pins and set mode and state to 'high'

for i in pinList: 
    GPIO.setup(i, GPIO.OUT) 
    GPIO.output(i, GPIO.HIGH)

# time to sleep between operations in the main loop

SleepTimeL = 1;

# main loop

print "start"

try:
#        GPIO.output(23, GPIO.LOW)
 #       time.sleep(SleepTimeL)
#	GPIO.output(23, GPIO.HIGH)
#	GPIO.output(14, GPIO.LOW)
#	time.sleep(SleepTimeL)
#	GPIO.output(14, GPIO.HIGH)
#	GPIO.output(15, GPIO.LOW)
#	time.sleep(SleepTimeL)
#	GPIO.output(15, GPIO.HIGH)
	GPIO.output(28, GPIO.LOW)
	GPIO.output(27, GPIO.LOW)
        GPIO.output(26, GPIO.LOW)
	GPIO.output(25, GPIO.LOW)
	GPIO.output(24, GPIO.LOW)
	GPIO.output(23, GPIO.LOW)
	GPIO.output(22, GPIO.LOW)
	time.sleep(25);
# End program cleanly with keyboard
except KeyboardInterrupt:
        print "  Quit"

# Reset GPIO settings
        GPIO.cleanup()

GPIO.cleanup();

# find more information on this script at
# http://youtu.be/WpM1aq4B8-A

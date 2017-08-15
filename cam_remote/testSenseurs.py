#!/usr/bin/python
import RPi.GPIO as GPIO
import time
port_caisse = 4
port_frigo_1 = 14
port_frigo_2 = 15
GPIO.setmode(GPIO.BCM)
GPIO.setup(port_caisse, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_1, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_2, GPIO.IN, pull_up_down=GPIO.PUD_UP)
def main():
    while True:
        time.sleep(0.5)
        if not GPIO.input(port_caisse):
            print "caisse ouverte"
        if not GPIO.input(port_frigo_2) :#and not GPIO.input(port_frigo_2):
            print "frigo ouvert"
        if  GPIO.input(port_caisse) and GPIO.input(port_frigo_1) and GPIO.input(port_frigo_2):
            print "caisse et frigos fermes"
main()

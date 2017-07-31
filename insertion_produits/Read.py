#!/usr/bin/env python
# -*- coding: utf8 -*-

import RPi.GPIO as GPIO
import MFRC522
import signal
import sys
import time

# Capture SIGINT for cleanup when the script is aborted
def end_read(signal,frame):
    global continue_reading
    print("Ctrl+C captured, ending  insertion produit.")
    GPIO.cleanup()
    sys.exit(0)

def main():

    # Hook the SIGINT
    signal.signal(signal.SIGINT, end_read)

    # Create an object of the class MFRC522
    MIFAREReader = MFRC522.MFRC522()


    while True:
         # Scan for cards    
        (status,TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)

        # If a card is found
        if status == MIFAREReader.MI_OK:
            print("Card detected")
    
         # Get the UID of the card
        (status,uid) = MIFAREReader.MFRC522_Anticoll()

        # If we have the UID, continue
        if status == MIFAREReader.MI_OK:
            card= str(uid[0])+str(uid[1])+str(uid[2])+str(uid[3])
            return card
        time.sleep(0.35) 
main()

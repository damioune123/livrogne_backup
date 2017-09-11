#!/usr/bin/env python3
# -*- coding: utf8 -*-

import RPi.GPIO as GPIO
import MFRC522
import signal
from builtins import print

continue_reading_sector = True
continue_writing_token = True

# Capture SIGINT for cleanup when the script is aborted
def tokenToHexArray(token):
    listResult=[]
    for i in token:
        listResult.append(ord(i))

    return listResult
def hexToStr(hexa):
    return bytearray.fromhex(hexa)

def end_read(signal,frame):
    global continue_writing_token
    global continue_reading_sector 
    print("Ctrl+C captured, ending read.")
    continue_reading_sector=False
    continue_writing_token=False
    GPIO.cleanup()

def readSector(sector):
    global continue_reading_sector
    continue_reading_sector= True
    signal.signal(signal.SIGINT, end_read)
    # Create an object of the class MFRC522
    MIFAREReader = MFRC522.MFRC522()
    MIFAREReader.MFRC522_StopCrypto1()
   # key = [0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]
    key = [0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]
    while continue_reading_sector:
        (status,TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)
        (status,uid) = MIFAREReader.MFRC522_Anticoll()
        if status == MIFAREReader.MI_OK:
            MIFAREReader.MFRC522_SelectTag(uid)
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, sector, key, uid)
            if status == MIFAREReader.MI_OK:
                sec = MIFAREReader.MFRC522_Read(sector)
                MIFAREReader.MFRC522_StopCrypto1()
                continue_reading_sector=False
                return sec
def toStr(s):
        return s and chr(int(s[:2], 16)) + toStr(s[2:]) or ''

def readToken():
    signal.signal(signal.SIGINT, end_read)
    sec1 = readSector(1) 
    sec2 = readSector(2)
    sec4 = readSector(4)
    sec5 = readSector(5)
    sec8 = readSector(8)
    sec1.extend(sec2)
    sec1.extend(sec4)
    sec1.extend(sec5)
    sec1.extend(sec8)
    hexList=sec1
    strHex=""
    for i in hexList:
        strHex+=chr(i)
    return strHex

def writeToken(token):
    global continue_writing_token
    fullData=tokenToHexArray(token)
    data0=fullData[0:16]
    data1=fullData[16:32]
    data2=fullData[32:48]
    data3=fullData[48:64]
    data4=fullData[64:]
    # Hook the SIGINT
    signal.signal(signal.SIGINT, end_read)

    # Create an object of the class MFRC522
    MIFAREReader = MFRC522.MFRC522()

    # This loop keeps checking for chips. If one is near it will get the UID and authenticate
    while continue_writing_token:
    
    # Scan for cards    
        (status,TagType) = MIFAREReader.MFRC522_Request(MIFAREReader.PICC_REQIDL)

    # If a card is found
        if status == MIFAREReader.MI_OK:
            print("Card detected")
    
    # Get the UID of the card
        (status,uid) = MIFAREReader.MFRC522_Anticoll()

    # If we have the UID, continue
        if status == MIFAREReader.MI_OK:

        # Print UID
            print("Card read UID: "+str(uid[0])+","+str(uid[1])+","+str(uid[2])+","+str(uid[3]))
    
        # This is the default key for authentication
            key = [0xFF,0xFF,0xFF,0xFF,0xFF,0xFF]
        
        # Select the scanned tag
            MIFAREReader.MFRC522_SelectTag(uid)

            for i in range(len(data4), len(data0)):
                data4.append(0X00)
        # Authenticate
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, 1, key, uid)
            if status == MIFAREReader.MI_OK:
                MIFAREReader.MFRC522_Write(1, data0)
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, 2, key, uid)
            if status == MIFAREReader.MI_OK:
                MIFAREReader.MFRC522_Write(2, data1)
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, 4, key, uid)
            if status == MIFAREReader.MI_OK:
                MIFAREReader.MFRC522_Write(4, data2)
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, 5, key, uid)
            if status == MIFAREReader.MI_OK:
                MIFAREReader.MFRC522_Write(5, data3)
            status = MIFAREReader.MFRC522_Auth(MIFAREReader.PICC_AUTHENT1A, 8, key, uid)
            if status == MIFAREReader.MI_OK:
                MIFAREReader.MFRC522_Write(8, data4)
            MIFAREReader.MFRC522_StopCrypto1()
            continue_writing_token = False
writeToken("i0NCWJjaaD++t8ylcu5wQZgF56czvYv+YGCIgV5h7KsvF4ZSd/2ZYIEShoFki8m4uVg=")
print(readToken())

#!/usr/bin/python3
import RPi.GPIO as GPIO
import time
from threading import Thread

GPIO.setmode(GPIO.BCM)

GPIO.setup(5,GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

global count
global counting
global counter

counting = 0

def firstFunction():
    global counter
    global ts
    global counting
    count = 1
    counter = 0
    ts = time.time()
    while True:
        if (count == 1):
            GPIO.wait_for_edge(5, GPIO.RISING)
            counting = 1
            counter += 1
            print("Pulse comming ! "+str(counter))
            ts = time.time()


def secondFunction():
    global count
    global counting
    global counter
    while True:
        cts = ts + 0.6
        if (cts < time.time()):
            print("Counting looks like finished with "+str(counter))
            count = 0
            counting = 0
            print("We process the Payment NOW !")
            if (counter == 2):
                print("5 centime")
            if (counter == 4):
                print("10 centime")
            if (counter == 10):
                print("20 centime")
            if (counter == 15):
                print("50 centime")
            if (counter == 20):
                print("1 euro")
            if (counter == 30):
                print("2 euro")
            counter = 0
            count = 1
            print("Ready to process the next payment !")
            time.sleep(1)

def thirdFunction():
    global ts
    while True:
        if (counting == 0):
            ts = time.time()
            time.sleep(1)
try:
    t1 = Thread(target = firstFunction)
    t2 = Thread(target = secondFunction)
    t3 = Thread(target = thirdFunction)
    t1.start()
    t2.start()
    t3.start()
except KeyboardInterrupt:
    t1.stop()
    t2.stop()
    t3.Stop()
    GPIO.cleanup()

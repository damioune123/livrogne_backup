#!/usr/bin/python
import RPi.GPIO as GPIO
import time
import os
import signal
import subprocess
port_caisse = 4
port_frigo_1 = 14
port_frigo_2 = 15
GPIO.setmode(GPIO.BCM)
GPIO.setup(port_caisse, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_1, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_2, GPIO.IN, pull_up_down=GPIO.PUD_UP)
caisseClosed=True
frigoClosed=True
def caisseOrFrigoOpened():
    global caisseClosed
    global frigoClosed
    print('frigo/caisse closed v1: '+str(frigoClosed)+' / '+str(caisseClosed))
    if not caisseClosed or not frigoClosed:
        return True
    input_state_caisse =GPIO.input(port_caisse)
    input_state_frigo_1 =GPIO.input(port_frigo_1)
    input_state_frigo_2 =GPIO.input(port_frigo_2)
    if not input_state_caisse:
        caisseClosed = False
    if not input_state_frigo_1 or  not input_state_frigo_2:
        frigoClosed = False
        print('frigo/caisse closed v2: '+str(frigoClosed)+' / '+str(caisseClosed))
        return True
    else:
        return False

def caisseAndFrigoClosed():
    global caisseClosed
    global frigoClosed
    print('frigo/caisse closed v3: '+str(frigoClosed)+' / '+str(caisseClosed))
    input_state_caisse =GPIO.input(port_caisse)
    input_state_frigo_1 =GPIO.input(port_frigo_1)
    input_state_frigo_2 =GPIO.input(port_frigo_2)
    if input_state_caisse:
        caisseClosed = True
    if input_state_frigo_1 and input_state_frigo_2:
        frigoClosed = True
    print('frigo/caisse closed v4: '+str(frigoClosed)+' / '+str(caisseClosed))
    if frigoClosed and caisseClosed:
        return True
    else:
        return False

def subchild():
    os.execl("encode_cam.sh", "")

def child():
    newpid = os.fork()
    if newpid == 0:
         subchild()
    while True:
        time.sleep(0.5)
        if caisseAndFrigoClosed() == True:
            os.kill(newpid, signal.SIGINT)
            os._exit(0)  

def parent():
    caisseClosed=True
    frigoClosed=True
    while True:
        time.sleep(0.5)
        if caisseOrFrigoOpened() == True:
            print('Caisse et/ou frigo  ouverts')
            newpid = os.fork()
            if newpid == 0:
                child()
            os.wait()
            print('Caisse et frigo fermes')

parent()

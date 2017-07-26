#!/usr/bin/python
import RPi.GPIO as GPIO
import time, os, signal, subprocess
port_caisse = 4
port_frigo_1 = 14
port_frigo_2 = 15
GPIO.setmode(GPIO.BCM)
GPIO.setup(port_caisse, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_1, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_2, GPIO.IN, pull_up_down=GPIO.PUD_UP)
def caisseOrFrigoOpened():
    input_state_caisse =GPIO.input(port_caisse)
    input_state_frigo_1 =GPIO.input(port_frigo_1)
    input_state_frigo_2 =GPIO.input(port_frigo_2)
    if not input_state_caisse or (not input_state_frigo_1 and not input_state_frigo_2):
        return True
    else:
        return False

def caisseAndFrigoClosed():
    input_state_caisse =GPIO.input(port_caisse)
    input_state_frigo_1 =GPIO.input(port_frigo_1)
    input_state_frigo_2 =GPIO.input(port_frigo_2)
    if input_state_caisse and input_state_frigo_1 and input_state_frigo_2:
         return True
    else:
        return False

def child():
    newpid = os.fork()
    if newpid == 0:
         os.execl("stream_to_avi.sh", "")
    while True:
        time.sleep(0.5)
        if caisseAndFrigoClosed() == True:
            os.kill(newpid, signal.SIGTERM)
            os._exit(0)  

def parent():
    while True:
        try:
            time.sleep(0.5)
        except KeyboardInterrupt:
             print("Exiting frigo/caisse sensors daemon ...")
             os._exit(0)
        if caisseOrFrigoOpened() == True:
            print('Caisse et/ou frigo  ouverts')
            newpid = os.fork()
            if newpid == 0:
                child()
            os.waitpid(-1, 0)
            print('Caisse et frigo fermes')

parent()

#!/usr/bin/python3
# Copyright (c) CMNWorks
# Licensed under The MIT License
#
# @copyright     Copyright (c) CMNWorks Christopher M. Natan
# @author        Christopher M. Natan
# @link          http://cmnworks.com
# @license       http://www.opensource.org/licenses/mit-license.php MIT License


import RPi.GPIO as GPIO
import threading
import sys
import time

GPIO_PIN = 24
TIME_OUT = 15000


def coin_acceptor_listen():
    blocks_count = 0
    previous_block = -1
    current_block = 0
    reset_counter = 0


    GPIO.setup(GPIO_PIN, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.add_event_detect(GPIO_PIN, GPIO.RISING)

    while True:
        if GPIO.event_detected(GPIO_PIN):
            reset_counter = 1
            current_block += 1
            inserted = str(current_block)
            #print("pulses detected : "+str(current_block))
        if reset_counter >= 1:
            reset_counter += 1
        if reset_counter >= TIME_OUT:
            if current_block >5:
                previous_block = current_block
                blocks_count +=1
            elif previous_block !=-1 and previous_block >5 :
                print("nombre blocks : "+ str(blocks_count))
                block_count=0
            print("nombre blocks : "+ str(blocks_count))
            current_block=0
            reset_counter=0


try:
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)

    coinAcceptorThread = threading.Thread(name='CoinAcceptor', target=coin_acceptor_listen())
    coinAcceptorThread.start()
    coinAcceptorThread.join()

except (KeyboardInterrupt, SystemExit):
    print("Keyboard interrupt")
finally:
    print("Finish")
    GPIO.cleanup()

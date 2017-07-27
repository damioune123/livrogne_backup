#!/usr/bin/env python
import RPi.GPIO as GPIO
import time, os, signal, subprocess, fcntl
import sys, paramiko
port_caisse = 4
port_frigo_1 = 14
port_frigo_2 = 15
hostname = "192.168.0.233"
password = "raspberry"
username = "pi"
port = 22
GPIO.setmode(GPIO.BCM)
GPIO.setup(port_caisse, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_1, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_2, GPIO.IN, pull_up_down=GPIO.PUD_UP)
def openSSH():
    global ssh
    ssh = paramiko.SSHClient()
    ssh.load_system_host_keys()
    ssh.connect(hostname, port, username, password)

def execComm(command):
    global ssh
    (stdin, stdout, stderr) = ssh.exec_command(command)
    for line in stdout.readlines():
         print line

def closeSSH():
    ssh.close()

def startEncoding():
    execComm('/home/pi/livrogne_backup/cam/stream_to_avi.sh')

def stopEncoding():
    execComm('killall avconv')

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
    openSSH()
    startEncoding()
    while True:
        time.sleep(0.5)
        if caisseAndFrigoClosed() == True:
            try:
                stopEncoding()
            except Exception as e:
                print e
            finally:
                closeSSH()
                os._exit(0)

def parent():
    fname = 'cam_pid.lock'
    try:
       fd = os.open(fname, os.O_CREAT|os.O_WRONLY|os.O_EXCL)
    except OSError:
       # failed to open, another process is running
        with open(fname) as f:
            print "other process running:", f.readline()
            sys.exit()
    os.write(fd, '%d\n' % os.getpid())
    os.fsync(fd)
    while True:
        try:
            time.sleep(0.5)
        except KeyboardInterrupt:
            print("Exiting frigo/caisse sensors daemon ...")
            os.close(fd)
            os.remove(fname)
            os._exit(0)
        if caisseOrFrigoOpened() == True:
            print('Caisse et/ou frigo  ouverts')
            newpid = os.fork()
            if newpid == 0:
                child()
            os.waitpid(-1, 0)
            print('Caisse et frigo fermes')
parent()

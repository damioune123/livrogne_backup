#!/usr/bin/env python

import RPi.GPIO as GPIO
import time, os, signal, subprocess, fcntl, sys, paramiko
port_caisse = 4
port_frigo_1 = 15
port_frigo_2 = 15
hostname = "192.168.0.214"
password = "raspberry"
username = "pi"
port = 22
fname = '/var/lock/cam_pid.lock'
ssh=None
GPIO.setmode(GPIO.BCM)
GPIO.setup(port_caisse, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_1, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(port_frigo_2, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def openSSH():
    global ssh
    if ssh == None or not ssh.get_transport().is_active():
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
        ssh.load_system_host_keys()
        ssh.connect(hostname, port, username, password)

def execComm(command):
    global ssh
    (stdin, stdout, stderr) = ssh.exec_command(command)
    for line in stdout.readlines():
         print line

def closeSSH():
    global ssh
    if ssh!= None and ssh.get_transport().is_active():
        ssh.close()

def startEncoding():
    openSSH()
    execComm('/home/pi/livrogne_backup/cam/stream_to_avi.sh ')
def stopEncoding():
    print("caisse And frigo closed, 20 secs more of encoding ...")
    time.sleep(20)
    openSSH()
    execComm("killall avconv")
    closeSSH()

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

def signalTermHandler(signal, frame):
    global fname
    global fd
    try:
        os.close(fd)
        os.remove(fname)
    finally:
         closeSSH()
         print("Exiting frigo/caisse sensors daemon ...")
         sys.exit(0)
 
def encodingProcess():
    print("encoding process started")
    newpid = os.fork()
    if newpid ==0:
        startEncoding()
    else:
        while True:
            time.sleep(0.5)
            if caisseAndFrigoClosed() == True:
                stopEncoding()
                os.kill(newpid, signal.SIGKILL)
                print 'encoding process finished'
                sys.exit(0)

def main():
    global fd
    try:
       fd = os.open(fname, os.O_CREAT|os.O_WRONLY|os.O_EXCL)
    except OSError:
        with open(fname) as f:
            print "other process running:", f.readline()
            sys.exit()
    os.write(fd, '%d\n' % os.getpid())
    os.fsync(fd)
    signal.signal(signal.SIGINT, signalTermHandler)
    signal.signal(signal.SIGTERM, signalTermHandler)
    while True:
        if caisseOrFrigoOpened() == True:
            print('Caisse et/ou frigo  ouverts')
            newpid = os.fork()
            if newpid == 0:
                encodingProcess()
            os.waitpid(-1, 0)
        time.sleep(0.5)
main()

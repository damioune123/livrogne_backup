#!/usr/bin/env python

import sys, paramiko
hostname = "192.168.0.214"
password = "raspberry"
username = "pi"
port = 22
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
    global ssh
    ssh.close()
openSSH()
execComm('/home/pi/livrogne_backup/cam/stream_to_avi.sh')
execComm('sleep 20')
execComm('killall avconv')
closeSSH()



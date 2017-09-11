#!/usr/bin/python
import subprocess
import time
from datetime import datetime
from display import printLCD
def CPU():
    with open("/home/pi/RFID_C/temp_log.txt", "a") as f:
        proc = subprocess.Popen(["vcgencmd measure_temp"], stdout=subprocess.PIPE, shell=True)
        (out, err) = proc.communicate()
        proc = subprocess.Popen(["mpstat"], stdout=subprocess.PIPE, shell=True)
        (out2, err) = proc.communicate()
        liste = out2.split("\n")
        cpuListe =liste[3].split("  ")
        cpu = str(cpuListe[4])
        date = datetime.now().strftime("%d-%m-%Y-%H_%M_%S")
        f.write(date+" :  TEMP : "+out+" / CPU : "+cpu)
        retour=[]
        retour.append("CPU~"+out[:len(out)-1])
        retour.append("CPU~USAGE"+cpu+"%")
        return retour

#!/usr/bin/python2.7
import smtplib
import time, sys
from multiprocessing import Process, Queue
global fo_email_r
global fo_email_w
global pid_email

def email_process(q):
    print("yoyo")
    global fo_email_r
    FROM="livrognebar@gmail.com"
    password="Livrogn7"
    smtp_host="smtp.gmail.com"
    smtp_port=587
    TO = ["damienmeur@gmail.com", "le-danio@hotmail.com"]
    try: # make smtp server and login
        server = smtplib.SMTP(smtp_host, smtp_port)
        server.ehlo()
        server.starttls()
        server.login(FROM, password)
        i=0
        while(True):
	    data= q.get()
            time_start = time.time()
    	    SUBJECT = data[0]#to split
   	    TEXT = data[1] #to split
            if(data[0]=="off"):
                    sys.exit(0)
 	    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
            """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
	    server.sendmail(FROM, TO, message)
            time_end = time.time()
            t_delta = str(int(round(time_end-time_start)))
            print("Temps envoie %i : "+ t_delta)
            i=i+1
    except Exception as e :
        print(e)

def main():
	q = Queue()
        p = Process(target=email_process, args=(q,))
        p.start()
        for i in range(0, 5):
	    q.put(["LAST TEST%i"%(i), "TEST HEADER"])
	q.put(["off", "off"])
        print(p.is_alive())
main()

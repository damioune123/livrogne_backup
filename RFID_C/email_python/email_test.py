#!/usr/bin/python2.7
import smtplib, json, time, sys
from multiprocessing import Process, Queue

def email_process(q):
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
        if len(sys.argv) <=1 or len(sys.argv) >3:
            print("Usage %s path_email path_joint_piece" %(sys.argv[0]))
            return
        with open(sys.argv[1],"r") as emailF:
            emailJSON=emailF.read()
            print(emailJSON)
            email=json.loads(emailJSON)
        if "email" not in email or "subject" not in email["email"] or "body" not in email["email"]:
            print("Email must be written with json syntax and must contain a body and a subject")
            return
        subject = email["email"]["subject"]
        body=email["email"]["body"]
	q = Queue()
        p = Process(target=email_process, args=(q,))
        p.start()
        q.put([subject,body])
	q.put(["off", "off"])
        sys.exit(0)
main()

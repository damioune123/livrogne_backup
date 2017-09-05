#!/usr/bin/python2.7
import smtplib, json, time, sys, os
from threading import Thread
from Queue import Queue
from datetime import datetime
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email import Encoders

def email_process(q):
    FROM="livrognebar@gmail.com"
    password="Livrogn7"
    smtp_host="smtp.gmail.com"
    smtp_port=587
    TO = ["damienmeur@gmail.com", "le-danio@hotmail.com"]
    try: # make smtp server and login
        print("login email")
        server = smtplib.SMTP(smtp_host, smtp_port)
        server.ehlo()
        server.starttls()
        server.login(FROM, password)
        print("login email finished")
    except Exception as e :
        print(e)
    while(True):
        data= q.get()
        msg = MIMEMultipart()
        msg['Subject'] = data[0]
        msg['From'] = FROM
        msg['To'] = ', '.join(TO)
        part = MIMEBase('application', "octet-stream")
        part.set_payload(open(data[2], "rb").read())
        Encoders.encode_base64(part)
        part.add_header('Content-Disposition', 'attachment; filename=%s'%(data[3]))
        msg.attach(part)
        msg['TEXT']=data[1]
        print("sending email")
        try:
            server.sendmail(FROM, TO, msg.as_string())
        except:
            print(e)
        finally:
            print("email sent")
            q.task_done()

def main():
    date=datetime.now().strftime("%Y-%m-%d_%H_%M_%S")
    name="backup_ivrogne_"+date
    complete_f_name="/home/pi/backupDB/backups/"+name+".sql"
    print("dumping database")
    os.system("mysqldump -u root -pLivrogn8 --databases livrogne_api > "+complete_f_name)
    print("dumping database finish")
    q = Queue()
    p = Thread(target=email_process, args=(q,))
    p.setDaemon(True)
    p.start()
    subject = "Backup de la base de donnee a %s"%(date)
    body="Cet email comprend en piece attachee un backup de la base de donnees de l'ivrognee."
    q.put([subject,body, complete_f_name,name])
    q.join()
    print("exiting program")
    sys.exit(0)
main()

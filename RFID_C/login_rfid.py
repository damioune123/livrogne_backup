#!/usr/bin/python2
import sys, requests, json, os, time, smtplib
from datetime import datetime
from dateutil import parser
from threading import Thread
from Queue import Queue
import thread
serverIP="127.0.0.1"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
def stop():
    global q_email
    q_email.join()
    sys.exit(0)

def send_email(subject, body):
    global q_email
    q_email.put([subject,body])

def email_process(q_email):
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
    except Exception as e:
        print(e)
    while(True):
        data= q_email.get()
        SUBJECT = data[0]#to split
        TEXT = data[1] #to split
        message = "From: %s\nTo: %s\nSubject: %s\n\n%s" % (FROM, ", ".join(TO), SUBJECT, TEXT)
        try:
            print("SUBJECT : %s \n BODY : %s " %(data[0], data[1]))
            server.sendmail(FROM, TO, message)
        except Exception as e :
            print(e)
        finally:
            q_email.task_done()


def auth():
    if len(sys.argv) ==1:
        print("Usage %s rfid_uid" %(sys.argv[0]))
        stop()
    uid = sys.argv[1]
    url=baseURL+"/rfid-auth-tokens"
    data={"card_id":uid, "source": "tablette"}
    try:
        r=requests.post(url=url, data=json.dumps(data))
        tokenPyth=json.loads(r.content)
    except requests.exceptions.RequestException as e:
        email="""
            Bonjour chers Administrateurs,
            Il semblerait que le raspberry pi n'ait pas reussi a envoyer la requete au serveur pour authentifier un utilisateur av$
            Il s'agit d'un probleme majeur, le serveur etant connecte en local. Il doit s'agir d'une surchauffe du raspberry pi ba$
            Pour resoudre le probleme, il faudrait le redemarrer au moyenne du boutton rouge du domino.
            Resume de l'exception : %s \n
            Le probleme a eu lieu a %s."
            """%(str(e), datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        subject="Erreur de connexion pour l'authentification par carte a %s" %(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        send_email(subject, email)
        write_log("server", e)
        printLCD("Erreur connexion serveur")
        time.sleep(m_timeout*2)
        stop()
    if "value" not in tokenPyth:
        print("CARD NOT IN THE SYSTEM!")
        stop()
    print(tokenPyth)
    if tokenPyth["exception"] != "OK":
        email="""
Bonjour chers administrateurs,
Il semblerait que le serveur push node.js (websocket tablette/serveur) ne soit pas fonctionnel.
Deux possibilites : eteindre puis allumer le bar (bouton rouge domino) ou se connecter en ssh (192.168.0.210)
et taper la ligne "node push/index.js > /dev/null &"
Erreur survenue a %s"""%(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        subject="Erreur serveur websocket a %s"%(datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        send_email(subject, email)
def main():
    global q_email
    q_email = Queue()
    p1 = Thread(target=email_process, args=(q_email,))
    p1.setDaemon(True)
    p1.start()
    auth()
    stop()
main()

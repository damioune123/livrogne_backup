#!/usr/bin/python2
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
        write_log("email", "Erreur login email")
    while(True):
        data= q_email.get()
        SUBJECT = data[0]#to split
        TEXT = data[1] #to split
        if data[0]=="off":
            print("Exitting email process")
            sys.exit(0)
        message = "From: %s\nTo: %s\nSubject: %s\n\n%s" % (FROM, ", ".join(TO), SUBJECT, TEXT)
        try:
            server.sendmail(FROM, TO, message)
        except Exception as e :
            write_log("email", "Erreur envoi email : Subject :  %s \n Body :  %s\n Exception : %s" %(data[0], data[1], e))

def auth():
    global uId
    if len(sys.argv) ==1:
        print("Usage %s rfid_uid" %(sys.argv[0]))
        stop()
    uid = sys.argv[1]
    url=baseURL+"/rfid-auth-tokens"
    data={"card_id":uid}
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
            """%(e, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
        subject="Erreur de connexion pour l'authentification par carte a %s" %(datetime.now().strftime("%Y-%m_%d %H:%M:%S"))
        send_email(subject, email)
        write_log("server", e)
        printLCD("Erreur connexion serveur")
        stop()
    if "exception"  in tokenPyth:
        printLCD("CARD NOT IN~THE SYSTEM!")
        stop()
    tokenTemp=tokenPyth["value"]


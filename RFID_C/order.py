#!/usr/bin/python2
import  re, math, sys, time, signal, requests, json, os,  smtplib
from datetime import datetime
from Queue import Queue
from threading import Thread
import thread
from dateutil import parser

products ={}
tMax=5 # temps commande max
serverIP="10.0.2.2"
baseURL="http://"+serverIP+"/ivrogne_api_raspberry/web/app.php/api"
currentDir="/home/alex/livrogne_backup/RFID_C/"
uName="NO AUTHENTICATION YET"
m_timeout=1.5
delayBeforeOrder=5
    
def stop():
    global q_log
    global q_lcd
    printLCD("Goodbye !")
    q_log.join()
    q_lcd.join()
    sys.exit(0)

def leave_program():
    validate_order() 
    stop()
def handler_child_leave_order(signum, frame):
    leave_program()


def handler_child_enter_order(signum, frame):
    signal.signal(signal.SIGUSR1, handler_child_leave_order)
    order()

def count_items(products):
    total = 0
    for key in products:
        total+=products[key][0]
    return total

def validate_order():
    orderlines=[]
    for key in products:
        orderlines.append({"product":key, "quantity" :products[key][0]})
    payload={ "orderlines": orderlines}
    if role!="ROLE_BARMAN":
        url = baseURL+'/orders/client-self-order'
    else:
        url = baseURL+'/admin/orders/cash'
        printLCD("ORDER IN CASH")
        time.sleep(m_timeout)
    if orderlines:
        printLCD("WAIT FOR~VALIDATION")
        try:
            r = requests.post(url=url, data=json.dumps(payload), headers=headers)
            tokenRetour = json.loads(r.content)
        except requests.exceptions.RequestException as e:
            stop()
        if role=="ROLE_BARMAN":
            openRegister()
        if "INSUFFICIENT_CASH" in tokenRetour:
            printLCD("NOT ENOUGH CASH~TOTAL:"+str(tokenRetour["order_total"])+"E")
            time.sleep(m_timeout*3)
            printLCD("CUR.BALANCE:"+str(tokenRetour["balance"])+"E~MONEY LIM.:"+str(tokenRetour["money_limit"])+"E")
            time.sleep(m_timeout*3)
            return
        else:
            print(tokenRetour)
            printLCD("ORDER VALIDATED~TOTAL:"+str(tokenRetour["order_price"])+"euro")
            time.sleep(m_timeout*3)
    else:
        printLCD("NO PRODUCT")
        time.sleep(m_timeout)

def listen_button():
    time.sleep(1)
    printLCD("Entering order")
    os.kill(os.getpid(), signal.SIGUSR1)

def order():
    time.sleep(m_timeout)
    printLCD("ORDER STARTED")
    global products
    t_end = time.time() + tMax 
    while t_end > time.time() :
        try:
            time.sleep(1)
            barcode="5400141123081"
        except IOError as e:
            print( "IOERROR Barcode")
            write_log("scan", e)
            break
        url = baseURL+'/products/'+barcode
        try:
            r =  requests.get(url, headers=headers)
            tokenVerif = json.loads(r.content)
        except requests.exceptions.RequestException as e:
            write_log("server", e)
            printLCD("ERREUR seveur") 
            time.sleep(m_timeout*2)
            stop()
        if "message" not in tokenVerif: #si barcode valide	
            if barcode not in products:
                products[barcode]=[1, tokenVerif["name"]]
            else:
                products[barcode][0]+=1
            printLCD(products[barcode][1][:13]+"X"+str(products[barcode][0])+"~Amount items:"+str(count_items(products)))
        else :
            print( barcode +" :  codebarre non reconnu !")
            printLCD(barcode[:15]+":~NOT AVAILABLE")
    leave_program()

def auth():
    global headers
    global uAccount
    global uName
    global uId
    global role
    global available_money
    global current_money
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
        printLCD("Erreur connexion serveur")
        time.sleep(m_timeout*2)
        stop()
    if "value" not in tokenPyth:
        printLCD("CARD NOT IN~THE SYSTEM!")
        time.sleep(m_timeout)
        stop()
    tokenTemp=tokenPyth["value"]
    token = tokenTemp[1][1:len(tokenTemp[1])-1]
    token = tokenTemp.replace("\\", "")
    uName=tokenPyth["user"]["firstname"]+"_"+tokenPyth["user"]["lastname"]
    uName.replace("\ ","")
    uName=uName[:15]
    uId=tokenPyth["user"]["id"]
    role=tokenPyth["user"]["role"]
    if role =="ROLE_USER" or role =="ROLE_ADMIN":
        available_money=str(tokenPyth['user']["user_accounts"][0]["available_balance"])
        current_money=str(tokenPyth['user']["user_accounts"][0]["money_balance"])
    headers = {"X-Auth-Token": token,"Content-Type": "application/json"}

def enter_order():
    signal.signal(signal.SIGUSR1, handler_child_enter_order)
    t_left=0
    t_end = time.time() + delayBeforeOrder
    while t_end > time.time() :
        printLCD("PRESS BUTTON~TO START ORDER !")
        time.sleep(m_timeout)
        printLCD("Welcome !~"+uName)
        time.sleep(m_timeout)
        if role =="ROLE_USER" or role =="ROLE_ADMIN":
            printLCD("AVAILABLE MONEY:~"+available_money+"euro")
            time.sleep(m_timeout)
            printLCD("MONEY BALANCE :~"+current_money+"euro")
            time.sleep(m_timeout)
        t_left=int(round(t_end-time.time()))
        if t_left > 0 :
            printLCD("TIME LEFT:~"+str(t_left)+" sec")
            time.sleep(m_timeout)
    stop()

def log_thread(q_log):
    while True:
        data = q_log.get()
        message = uName+" at "+datetime.now().strftime("%Y-%m-%d %H:%M:%S")+" : "+str(data[1])+"\n"
        print(data[0]+" : "+message)
        q_log.task_done()

def LCD_thread(q_lcd):
    while True:
        data=q_lcd.get()
        try:
            print(data)
         #   pLCD(data)
        except Exception as e:
            write_log("lcd",str(e))
        finally:
            q_lcd.task_done()

def printLCD(string):
    global q_lcd
    q_lcd.put(string) 

def write_log(log, message):
    global q_log
    q_log.put([log,message])

def main():
    global q_lcd
    global q_log
    global p1
    global p2
    global p3
    q_lcd= Queue()
    q_log= Queue()
    p2=Thread(target=LCD_thread, args=(q_lcd,))
    p3=Thread(target=log_thread, args=(q_log,))
    p4=Thread(target=listen_button)
    p2.setDaemon(True)
    p3.setDaemon(True)
    p4.setDaemon(True)
    p2.start()
    p3.start()
    auth()
    p4.start()
    enter_order()
main()

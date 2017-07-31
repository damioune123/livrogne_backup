#!/usr/bin/python
import Read
import os
import time
import requests
import json

URLBase = "http://192.168.0.210/ivrogne_api_raspberry/web/app.php/api"
URLAuth = URLBase+"/rfid-auth-tokens"

def read_card():
    print("Waiting for admin card to authenticate ...")
    return Read.main()

def auth():
    authenticated = False
    while not authenticated :
        card = read_card()
        print "Card read : "+card
        headers = {"Content-Type": "application/json" }
        payload = { "card_id" : card }
        r = requests.post(URLAuth, data=json.dumps(payload), headers=headers)
        tokenRetour = json.loads(r.content)
        if "user" in tokenRetour and "role" in tokenRetour["user"] and (tokenRetour["user"]["role"]=="ROLE_SUPER_ADMIN" or tokenRetour["user"]["role"]=="ROLE_ADMIN"):
                print "AUTHENTICATED ! \n ROLE : "+ tokenRetour["user"]["role"]+ " / username : "+tokenRetour["user"]["username"]
                return tokenRetour["value"]
        elif "user" not in tokenRetour :
            print "La carte n'est pas lie a un compte"
        else:
            print "La carte n'a pas un role super admin ou admin "

def main():
    token = auth()
    print "TOKEN : "+ token

main()



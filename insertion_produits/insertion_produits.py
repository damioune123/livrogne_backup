#!/usr/bin/python
import Read, os, time, requests, json, sys, signal

URLBase = "http://192.168.0.210/ivrogne_api_raspberry/web/app.php/api"
URLAuth = URLBase+"/rfid-auth-tokens"
URLCategories = URLBase+"/product-categories"
URLProducts = URLBase+"/products"
URLAdminProducts = URLBase+"/admin/products"

def auth():
    authenticated = False
    while not authenticated :
        print("Waiting for admin card to authenticate ...")
        card = Read.main()
        print "Card read : "+card
        headers = {"Content-Type": "application/json" }
        payload = { "card_id" : card }
        r = requests.post(URLAuth, data=json.dumps(payload), headers=headers)
        tokenRetour = json.loads(r.content)
        if "user" in tokenRetour and "role" in tokenRetour["user"] and (tokenRetour["user"]["role"]=="ROLE_SUPER_ADMIN" or tokenRetour["user"]["role"]=="ROLE_ADMIN"):
            print "AUTHENTICATED ! \n ROLE : "+ tokenRetour["user"]["role"]+" \n Firstname : "+tokenRetour["user"]["firstname"]
            return tokenRetour["value"]
        elif "user" not in tokenRetour :
            print "La carte n'est pas lie a un compte"
        else:
            print "La carte n'a pas un role super admin ou admin "
def read_barcode():
        hid = { 4: 'a', 5: 'b', 6: 'c', 7: 'd', 8: 'e', 9: 'f', 10: 'g', 11: 'h', 12: 'i', 13: 'j', 14: 'k', 15: 'l', 16: 'm', 17: 'n', 18: 'o', 19: 'p', 20: 'q', 21: 'r', 22: 's', 23: 't', 24: 'u', 25: 'v', 26: 'w', 27: 'x', 28: 'y', 29: 'z', 30: '1', 31: '2', 32: '3', 33: '4', 34: '5', 35: '6', 36: '7', 37: '8', 38: '9', 39: '0', 44: ' ', 45: '-', 46: '=', 47: '[', 48: ']', 49: '\\', 51: ';' , 52: '\'', 53: '~', 54: ',', 55: '.', 56: '/'  }

        hid2 = { 4: 'A', 5: 'B', 6: 'C', 7: 'D', 8: 'E', 9: 'F', 10: 'G', 11: 'H', 12: 'I', 13: 'J', 14: 'K', 15: 'L', 16: 'M', 17: 'N', 18: 'O', 19: 'P', 20: 'Q', 21: 'R', 22: 'S', 23: 'T', 24: 'U', 25: 'V', 26: 'W', 27: 'X', 28: 'Y', 29: 'Z', 30: '!', 31: '@', 32: '#', 33: '$', 34: '%', 35: '^', 36: '&', 37: '*', 38: '(', 39: ')', 44: ' ', 45: '_', 46: '+', 47: '{', 48: '}', 49: '|', 51: ':' , 52: '"', 53: '~', 54: '<', 55: '>', 56: '?'  }

        fp = open('/dev/hidraw0', 'rb')
        ss = ""
        shift = False
        done = False
        def handler(signum, frame):
                raise IOError("No input on barcode scan")

        while done==False:
                buffer = fp.read(8)
                for c in buffer:
                        if ord(c) > 0:
                                if int(ord(c)) == 40:
                                        done = True
                                        break;
                                if shift: 
                                        if int(ord(c)) == 2 :
                                                shift = True
                                        else:
                                                ss += hid2[ int(ord(c)) ]
                                                shift = False
                                else:
                                        if int(ord(c)) == 2 :
                                                shift = True
                                        else:
                                                ss += hid[int(ord(c))]
         
        fp.close()
        return ss
def read_categories(token):
    headers = {"Content-Type": "application/json", "X-Auth-Token": token }
    r = requests.get(URLCategories, headers = headers)
    jsonRetour = json.loads(r.content)
    print "Affichage categories :"
    for cat in range(1, len(jsonRetour)+1):
        print str(cat) +" : "+jsonRetour[cat-1]["category_name"]+" / prix :"+str(jsonRetour[cat-1]["price"])+"euro"
    choix =-1
    while choix <1 or choix > len(jsonRetour):
        choix = int(raw_input("Veuillez taper un chiffre parmi la liste ci-dessus : " ))
    return choix

def yes_or_no(question):
    reply = str(raw_input(question+' (y/n): ')).lower().strip()
    if reply[0] == 'y':
        return True
    if reply[0] == 'n':
        return False
    else:
        return yes_or_no("Uhhhh... please enter ")

def record_products(token):
    headers = {"Content-Type": "application/json", "X-Auth-Token": token }
    while True:
        print "Veuillez scanner un produit ..."
        barcode = read_barcode()
        print "barcode : "+barcode 
        r = requests.get(URLProducts+"/"+barcode, headers=headers)
        jsonRetour = json.loads(r.content)
        if "product_category" not in jsonRetour:
            print "Produit pas encore encode ..."
            pc = read_categories(token)
            name = str(raw_input("Veuillez saisir un nom pour le produit: "))
            payload = {"productCategory" : pc, "name" : name, "barcode" : barcode}
            r = requests.post(URLAdminProducts, headers = headers, data = json.dumps(payload))
            retour = json.loads(r.content)
            if "product_category" in retour:
                print "Le produit "+retour["name"]+" a bien ete encode avec le codebarre : "+ retour["barcode"]
            else :
                print "Erreur lors de l'encodage du produit"
        else:
            if yes_or_no("Codebarre deja encode , souhaitez vous changer les informations sur le produit : "+jsonRetour["name"]):
                pc = read_categories(token)
                name = str(raw_input("Veuillez saisir un nom pour le produit: "))
                payload = {"productCategory" : pc, "name" : name, "barcode" : barcode}
                r = requests.patch(URLAdminProducts+"/"+barcode, headers = headers, data = json.dumps(payload))
                retour = json.loads(r.content)
                if "product_category" in retour:
                        print "Le produit "+retour["name"]+" a bien ete encode avec le codebarre : "+ retour["barcode"]
                else :
                        print "Erreur lors de l'encodage du produit"

def handler_stop():
    os.system("sudo service rfid_daemon start")
    sys.exit(0)

def main():
    signal.signal(signal.SIGINT, handler_stop)
    os.system("sudo service rfid_daemon stop")
    token=auth()
    print(token)
    record_products(token)

main()



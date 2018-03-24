#!/usr/bin/python
from datetime import datetime
from dateutil import parser
import requests, json, time, sys
appKey="597b3cab2768a91069e47ef24ed7daee"
headers = {"Authorization": "Bearer "+appKey,"Accept": "application/json"}
baseURL="https://opendata-api.stib-mivb.be/OperationMonitoring/1.0/PassingTimeByPoint/"
TIME_ATTEMPT=5
MAX_ATTEMPT=15

"""
ARRETS_ID:

	BIENFAITEURS:
		BUS:
			3299 : 65 BOURGET / N04 cimetiere de bruxelles
			6210 : 65 gare centrale / N04 gare centrale
		TRAMS:
			3308F : 25 VERS ROGIER / 62 CIM. DE JETTE
			3360F : 25 VERS GARE BOONDAEL / 62 EUROCONTROL
	CHAZAL:
		BUS:
			2916 : 64 PORTE DE NAMUR 
			2976 : 64 MACHELEN 
		TRAMS:
			5355 : 7 HEYZEL
			5307 : 7 VANDERKINDERE
	COTEAUX:
		BUS:
			6203 : 66 PEAGE
			3164 : 59 BORDET STATION
			3309 : 66 DE BROUCKERE
			3112 : 59 HOPITAL ETTERBEEK-IXELLES
	
"""

def mergeDicts(x, y):
    z = x.copy()   # start with x's keys and values
    z.update(y)    # modifies z with y's keys and values & returns None
    return z

def sortMinutesDelta(dico):
    for key, value in dico.iteritems():
        dico[key]=sorted(value)
    return dico

def getMinutesDelta(date):
    now=datetime.now()
    delta=date-now
    return int((delta.total_seconds())%3600//60)

def passingTimesToString(nomArret, divers, dico):
    retour=nomArret+" - "+divers+":\n"
    for key, values in dico.iteritems():
        retour+=key+" dans "
        for i in range(len(values)):
	    if i ==0: 
                retour+=str(values[i])+" min."
	    elif i == len(values) -1:
                retour+=" et "+str(values[i])+" min."
	    else:
                retour+=", "+str(values[i])+" min."
	retour+="\n"
    return retour

def get2916PassingTimes():
    dico={}
    #2916 : 64 PORTE DE NAMUR / 65 GARE CENTRALE
    r =  requests.get(baseURL+"2916", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="64":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "64-PORTE-DE-NAMUR" in dico :
	   	dico["64-PORTE-DE-NAMUR"].append(delta)
	   else:
	        dico["64-PORTE-DE-NAMUR"]=[delta]
    return dico

def get2976PassingTimes():
    dico={}
    #2976 : 64 MACHELEN 
    r =  requests.get(baseURL+"2976", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="64":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "64-MACHELEN" in dico :
	   	dico["64-MACHELEN"].append(delta)
	   else:
	        dico["64-MACHELEN"]=[delta]
    return dico

def get5355PassingTimes():
    dico={}
    #5355 : 7 HEYZEL
    r =  requests.get(baseURL+"5355", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="7":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "7-HEYZEL" in dico :
	   	dico["7-HEYZEL"].append(delta)
	   else:
	        dico["7-HEYZEL"]=[delta]
    return dico

def get5307PassingTimes():
    dico={}
    #5307 : 7 VANDERKINDERE
    r =  requests.get(baseURL+"5307", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="7":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "7-VANDERKINDERE" in dico :
	   	dico["7-VANDERKINDERE"].append(delta)
	   else:
	        dico["7-VANDERKINDERE"]=[delta]
    return dico

def get6203PassingTimes():
    dico={}
    #6203 : 66 PEAGE
    r =  requests.get(baseURL+"6203", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="66":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "66-PEAGE" in dico :
	   	dico["66-PEAGE"].append(delta)
	   else:
	        dico["66-PEAGE"]=[delta]
    return dico

def get3309PassingTimes():
    dico={}
    #3309 : 66 DE BROUCKERE
    r =  requests.get(baseURL+"3309", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="66":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "66-DE-BROUCKERE" in dico :
	   	dico["66-DE-BROUCKERE"].append(delta)
	   else:
	        dico["66-DE-BROUCKERE"]=[delta]
    return dico

def get3164PassingTimes():
    dico={}   
    #3164 : 59 BORDET STATION
    r =  requests.get(baseURL+"3164", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="59":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "59-BORDET-STATION" in dico :
	   	dico["59-BORDET-STATION"].append(delta)
	   else:
	        dico["59-BORDET-STATION"]=[delta]
    return dico

def get3112PassingTimes():
    dico={}
    #3112 : 59 HOPITAL ETTERBEEK-IXELLES
    r =  requests.get(baseURL+"3112", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="59":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "59-HOPITAL-ETT.-IXELLES" in dico :
	   	dico["59-HOPITAL-ETT.-IXELLES"].append(delta)
	   else:
	        dico["59-HOPITAL-ETT.-IXELLES"]=[delta]
    return dico

def get3308FPassingTimes():
    dico={}
    #3308F : 25 VERS ROGIER / 62 CIM. DE JETTE
    r =  requests.get(baseURL+"3308F", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="25":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "25-ROGIER" in dico :
	   	dico["25-ROGIER"].append(delta)
	   else:
	        dico["25-ROGIER"]=[delta]
       else:
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "62-CIM-JETTE" in dico :
	   	dico["62-CIM-JETTE"].append(delta)
	   else:
	   	dico["62-CIM-JETTE"]=[delta]
    return dico

def get6210PassingTimes():
    dico={}
    #6210 : 65 gare centrale / N04 gare centrale
    r =  requests.get(baseURL+"6210", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="65":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "65-GARE-CENTRALE" in dico :
	   	dico["65-GARE-CENTRALE"].append(delta)
	   else:
	        dico["65-GARE-CENTRALE"]=[delta]
       else:
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "N04-GARE-CENTRALE" in dico :
	   	dico["N04-GARE-CENTRALE"].append(delta)
	   else:
	   	dico["N04-GARE-CENTRALE"]=[delta]
    return dico

def get3299PassingTimes():
    dico={}
    #3299 : 65 BOURGET / N04 cimetiere de bruxelles    
    r =  requests.get(baseURL+"3299", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="65":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "65-BOURGET" in dico :
	   	dico["65-BOURGET"].append(delta)
	   else:
	        dico["65-BOURGET"]=[delta]
       else:
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "N04-CIM-BXL" in dico :
	   	dico["N04-CIM-BXL"].append(delta)
	   else:
	   	dico["N04-CIM-BXL"]=[delta]
    return dico

def get3360FPassingTimes():
    dico={}
    #3360F : 25 VERS GARE BOONDAEL / 62 EUROCONTROL
    r =  requests.get(baseURL+"3360F", headers=headers)
    rJson = json.loads(r.content)
    if len(rJson["points"])==0:
        raise ValueError("No bus/trams passing time in next minutes, try aggain tomorrow")
    for e in rJson["points"][0]["passingTimes"]:
       if e["lineId"] =="25":
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "25-GARE-BOONDAEL" in dico :
	   	dico["25-GARE-BOONDAEL"].append(delta)
	   else:
	        dico["25-GARE-BOONDAEL"]=[delta]
       else:
	   delta=getMinutesDelta(parser.parse(e["expectedArrivalTime"]))
	   if "62-EUROCONTROL" in dico :
	   	dico["62-EUROCONTROL"].append(delta)
	   else:
	   	dico["62-EUROCONTROL"]=[delta]
    return dico

def getDicoBienfaiteurs():
    dico={}
    counter=0
    while True:
       dico={}
       try:
	    counter+=1
            dico=mergeDicts(dico, get3299PassingTimes())
	    print("1/12 requests done")
            dico=mergeDicts(dico, get6210PassingTimes())
	    print("2/12 requests done")
            dico=mergeDicts(dico, get3308FPassingTimes())
	    print("3/12 requests done")
            dico=mergeDicts(dico, get3360FPassingTimes())
	    print("4/12 requests done")
	    break
       except ValueError, e:
           print(str(e))
	   sys.exit(1)
       except:
	    print("STIB QUOTA REACHED, TRYING AGAIN TO FETCH DATA / TOTAL ATTEMPT : "+str(counter))
	    time.sleep(TIME_ATTEMPT)
	    if counter > MAX_ATTEMPT:
	        sys.exit(1)
    sortMinutesDelta(dico)
    return dico

def getDicoChazal():
    dico={}
    counter=0
    while True:
        dico={}
	try:
	   counter+=1
	   dico=mergeDicts(dico, get2916PassingTimes())
	   print("9/12 requests done")
           dico=mergeDicts(dico, get2976PassingTimes())
	   print("10/12 requests done")
    	   dico=mergeDicts(dico, get5355PassingTimes())
	   print("11/12 requests done")
    	   dico=mergeDicts(dico, get5307PassingTimes())
	   print("12/12 requests done")
	   break
        except ValueError, e:
           print(str(e))
	except:
	    print("STIB QUOTA REACHED, TRYING AGAIN TO FETCH DATA / TOTAL ATTEMPT : "+str(counter))
	    time.sleep(TIME_ATTEMPT)
	    if counter > MAX_ATTEMPT:
	        sys.exit(1)
    sortMinutesDelta(dico)
    return dico

def getDicoCoteaux():
    dico={}
    counter=0
    while True:
        dico={}
	try:
            counter+=1
    	    dico=mergeDicts(dico, get6203PassingTimes())
	    print("5/12 requests done")
    	    dico=mergeDicts(dico, get3164PassingTimes())
	    print("6/12 requests done")
    	    dico=mergeDicts(dico, get3309PassingTimes())
	    print("7/12 requests done")
            dico=mergeDicts(dico, get3112PassingTimes())
	    print("8/12 requests done")
	    break
        except ValueError, e:
           print(str(e))
	except:
	    print("STIB QUOTA REACHED, TRYING AGAIN TO FETCH DATA / TOTAL ATTEMPT : "+str(counter))
	    time.sleep(TIME_ATTEMPT)
	    if counter > MAX_ATTEMPT:
	        sys.exit(1)
    sortMinutesDelta(dico)
    return dico

def mergeString():
    retour=""
    retour+=passingTimesToString("Bienfaiteurs", "2 min de marche  - 180m ", getDicoBienfaiteurs())
    retour+="\n"
    retour+=passingTimesToString("Coteaux", "7 min de marche  - 550m ", getDicoCoteaux())
    retour+="\n"
    retour+=passingTimesToString("Chazal", "9 min de marche  - 750m ", getDicoChazal())
    return retour

print("Warning : as the STIB doesn't allow more than 20 requests every minute, please set the MAX_ATTEMPT and TIME_ATTEMPT accordingly to your needs")
print(mergeString())


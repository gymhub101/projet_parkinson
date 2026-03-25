import os
import json
from datetime import date,datetime

filename = "alerte.json"

#si nexiste pas rien à suppr
if not os.path.exists(filename):
 pass

alerts = []
#si alerte.json non vide, on récupère les alertes à potentiellement suppr
if os.path.getsize(filename) > 0:
 with open(filename, 'r') as f:
  alerts = json.load(f)

month1 = ((datetime.now()).month) - 3
#date d'ancienneté 3 mois dancienneté ca dégage
date_ancien = date.today().replace(month=month1)

cpt = 0
if len(alerts) > 0:
 for x in alerts:
  datex = datetime.strptime(x["date"], "%Y-%m-%d") #recup la date de alerts (str to date object)
  datex = datex.date() #enlever le temps xx:xx:xx
  if datex < date_ancien:
   alerts.pop(cpt) #suppr de alertes
 cpt+=1

#ecrire le nouveau fichier alerte.json sans les alertes anciennes donc suppr
with open(filename, 'w') as f:
 json.dump(alerts, f, indent=4, ensure_ascii=False)

#display test
with open(filename, 'r') as f:
 display = json.load(f)

print(json.dumps(display, indent=4, ensure_ascii=False))

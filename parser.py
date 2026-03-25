import json
import os
from info import Info
from datetime import date

filename = "alerte.json"

#verif existence
if not os.path.exists(filename):
 with open(filename,'w') as f:
  json.dump([], f, indent=4) #initialiser liste vide dans laerte.json

alerts = []
#si alerte.json non vide
if os.path.getsize(filename) > 0:
 with open(filename,'r') as f:
  alerts = json.load(f)

#si alerte.json vide initialise avec liste vide
else:
 with open(filename, 'w') as f:
  json.dump([], f ,indent=4)

#le dernier <item> du fichier xml fetch
last_lines = []
with open("index.xml", encoding="utf-8") as f:
 for line in (f.readlines() [-9:]):
  last_lines.append(line)

#degager les balises inutiles
degage = [0,2,4,6,7,8]
new_lines = [i for x, i in enumerate(last_lines) if x not in degage]

#creer objet info pour acceder aux infos pc (produit par info.py) : ram cpu disk
info_pc = Info()

titre = new_lines[0].replace("<title>", "").replace("</title>", "").strip()
description = new_lines[1].replace("<description>", '').replace("</description>", "").strip()
date1 = new_lines[2][20:31]

mois = {"Jan":1,"Feb":2,"Mar":3,"Apr":4,"May":5,"Jun":6,"Jul":7,"Aug":8,"Sep":9,"Oct":10,"Nov":11,"Dec":12}

d2 = date(int(date1[7:11]),mois[date1[3:6]],int(date1[0:2]))
#json ne prend d'objet date
d2_valid = str(d2)
print(d2_valid)

cpu = info_pc.stat[0]
ram = info_pc.stat[1]
disk= info_pc.stat[2]


#données à dump au json
alerte_new = {"titre": titre,
"description" : description,
"date" : d2_valid,
"info_pc" : {"cpu" : cpu, "ram" : ram, "disk" : disk}
}

meme_date = False
for a in alerts:
 if alerte_new["date"] == a["date"]:
  meme_date = True

if not meme_date:
 alerts.append(alerte_new) #append au lieu de overwrite le fichier

 with open('alerte.json', 'w') as f:
  json.dump(alerts, f, indent=4, ensure_ascii=False)

with open('alerte.json', 'r') as f:
 display = json.load(f)

print(json.dumps(display, indent=4, ensure_ascii=False))

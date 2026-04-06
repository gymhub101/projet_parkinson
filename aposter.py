import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import cairosvg

with open("aposter.txt",'r') as f:
    a = f.read()
if len(a) < 5:
 exit()

envoyer = "Johnbagger288@gmail.com"
recu = "Johnbagger288@gmail.com"
mdp_appli = "axpunwmvzdwzdysf"

svg = "machine.svg"
png = "machine.png"

cairosvg.svg2png(url=svg, write_to=png)

msg = MIMEMultipart()
msg['From'] = envoyer
msg['To'] = recu
msg['Subject'] = "alerte fatale parc informatique situation de crise !!!"

info = f"{a}\nLe graphe affichant toutes les données de machine 1 est joint ci-dessous."
msg.attach(MIMEText(info, 'plain'))

with open(png, "rb") as f:
    part = MIMEBase('image', 'png')
    part.set_payload(f.read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', f'attachment; filename="{png}"')
    msg.attach(part)

with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
    server.login(envoyer, mdp_appli)
    server.send_message(msg)

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import cairosvg  

sender = "Johnbagger288@gmail.com"
receiver = "Johnbagger288@gmail.com"
password = "axpunwmvzdwzdysf"

svg_file = "machine.svg"
png_file = "machine.png"

cairosvg.svg2png(url=svg_file, write_to=png_file)

msg = MIMEMultipart()
msg['From'] = sender
msg['To'] = receiver
msg['Subject'] = "alerte fatale parc informatique situation de crise !!!"

body = "Le graphe affichant les données de machine est joint ci-dessous."
msg.attach(MIMEText(body, 'plain'))

with open(png_file, "rb") as f:
    part = MIMEBase('image', 'png')
    part.set_payload(f.read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', f'attachment; filename="{png_file}"')
    msg.attach(part)

with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
    server.login(sender, password)
    server.send_message(msg)

print("Email with PNG attached successfully!")

import smtplib, ssl

with open("aposter.txt", 'r' ) as f:
    a = f.readlines()

if a != "":
    port = 465 # c le port SMTP OVER SSL SUR INTERNET
    serv_smtp = "smtp.gmail.com"
    envoyer= "johnbagger288@gmail.com"
    recevoir = "johnbagger288@gmail.com"
    mdp = "axpunwmvzdwzdysf"
    message = """\
    Subject: Hi there
    This message is sent from Python."""

    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(serv_smtp, port, context=context) as serveur:
        serveur.login(envoyer, mdp)
        serveur.sendmail(envoyer, recevoir, message)
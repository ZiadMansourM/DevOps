import os
import requests
import smtplib


EMAIL_ADDRESS = os.environ.get("EMAIL_ADDRESS")
EMAIL_PASSWORD = os.environ.get("EMAIL_PASSWORD")
recipients = [os.environ.get("DEVOPS_EMAIL"), os.environ.get("TEAM_LEADER_EMAIL")]


def notify_user():
    with smtplib.SMTP('smtp.zoho.com', 587) as smtp:
        smtp.ehlo()
        smtp.starttls()
        smtp.ehlo()

        smtp.login(EMAIL_ADDRESS, EMAIL_PASSWORD)

        subject = 'YOUR SITE IS DOWN!'
        body = 'Make sure the server restarted and it is back up'
        msg = f'Subject: {subject}\n\n{body}'

        # logging.info('Sending Email...')
        smtp.sendmail(EMAIL_ADDRESS, recipients, msg)


try:
    r = requests.get('http://www.thealphaflickr.xyz/', timeout=5)

    if r.status_code != 200:
        notify_user()
    else:
        print("Success: Up and running ...")
except Exception as e:
    notify_user()

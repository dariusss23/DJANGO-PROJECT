import schedule
import time
import os
import django
import logging
from datetime import timedelta
import random
from django.utils import timezone
from django.core.mail import send_mail
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'shop.settings')
django.setup()

from django.conf import settings
from django.contrib.auth import get_user_model
from aplicatie.models import Ceas

User = get_user_model()
logger = logging.getLogger('django')

def trimite_newsletter():
    now = timezone.now()

    zile_dict = {
        "luni": 0, 
        "marti": 1, 
        "miercuri": 2,
        "joi": 3, 
        "vineri": 4, 
        "sambata": 5, 
        "duminica": 6
    }

    zi_corecta = zile_dict.get(settings.NEWSLETTER_DAY.lower())

    if now.weekday() != zi_corecta or now.hour != settings.NEWSLETTER_HOUR:
        return

    limita = now - timedelta(minutes=settings.NEWSLETTER_MINUTES_LIMIT)
    
    useri = User.objects.filter(date_joined__lte=limita)

    if not useri.exists():
        print("Niciun utilizator eligibil pentru newsletter.")
        return

    mesaje_random = [
        "Iata recomandarile zilei!",
        "Cele mai vandute ceasuri din această saptamana:",
        "Astazi am gasit cateva ceasuri care s-ar putea sa iti placa!",
        "Noutati in colectia noastra!"
    ]

    ceasuri = Ceas.objects.order_by('pret')[:3]

    lista = ""
    for c in ceasuri:
        lista += f"- Model: {c.model}\n"
        lista += f"  Preț: {c.pret} RON\n"
        lista += f"  Brand: {c.brand.nume}\n"
        lista += "\n"

    mesaj = (
        random.choice(mesaje_random) + "\n\n"+ "Cele mai bune recomandari pentru tine:\n\n" + lista
    )


    for user in useri:
        send_mail(
            subject="Newsletter – Recomandarile zilei",
            message=mesaj,
            from_email="django14008@gmail.com",
            recipient_list=[user.email],
        )

        logger.info(f"Newsletter trimis catre {user.email}")

    print("Newsletter trimis cu succes.")

def run_scheduler():
    schedule.every(1).minutes.do(trimite_newsletter)

    print("Scheduler newsletter pornit.")

    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == '__main__':
    try:
        run_scheduler()
    except KeyboardInterrupt:
        print("Scheduler oprit manual.")
        sys.exit()

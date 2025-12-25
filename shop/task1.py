import schedule
import time
import os
import django
import logging
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'shop.settings')
django.setup()

from aplicatie.models import Ceas
from django.core.mail import mail_admins

logger = logging.getLogger('django')


def verifica_stoc_critic():
    PRAG_LIMITA = 5
    ceasuri_critice = Ceas.objects.filter(stoc__lte=PRAG_LIMITA)
    count = ceasuri_critice.count()

    if count > 0:
        logger.warning(f"[ALERTA STOC] {count} ceasuri sunt pe cale de epuizare!")

        message_text = "[ALERTA STOC] Urmatoarele ceasuri sunt pe cale de epuizare:\n\n"
        message_html = "<div style='background-color:red; padding:10px;'><h2>Alerta stoc critic!</h2><ul>"

        for ceas in ceasuri_critice:
            message_text += f" - {ceas.id_ceas}: {ceas.stoc} buc.\n"
            message_html += f"<li>{ceas.id_ceas}: {ceas.stoc} buc.</li>"
            print(f" -> Atentie: '{ceas.id_ceas}' mai are doar {ceas.stoc} buc. in stoc.")

        message_html += "</ul></div>"

        mail_admins(
            subject="[Alerta Stoc Critic] Ceasuri",
            message=message_text,
            html_message=message_html
        )
        print("Email trimis catre administratori.")
    else:
        print(f"[Stoc] Verificare efectuata. Niciun ceas sub limita de {PRAG_LIMITA} bucati.")


def run_scheduler():
    M = 15
    
    print(f"Planificator pornit. Verificarea stocului se face la fiecare {M} minute.")

    schedule.every(M).minutes.do(verifica_stoc_critic)

    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == '__main__':
    try:
        run_scheduler()
    except KeyboardInterrupt:
        print("Scheduler oprit manual.")
        sys.exit()

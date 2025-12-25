import schedule
import time
import os
import django
import logging
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'shop.settings')
django.setup()


from django.contrib.auth import get_user_model

User = get_user_model()
logger = logging.getLogger('django')

def sterge_useri_neconfirmati():
    useri = User.objects.filter(email_confirmat=False)
    
    count = useri.count()
    
    if count > 0:
        for user in useri:
            logger.warning(f"Stergere utilizator: {user.username} (Email neconfirmat)")
            user.delete()
    else:
        print("Niciun utilizator de sters momentan.")

def run_scheduler():
    K=2
    
    print(f"Planificator pornit. Se ruleaza la fiecare {K} minute.")

    schedule.every(K).minutes.do(sterge_useri_neconfirmati)

    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == '__main__':
    try:
        run_scheduler()
    except KeyboardInterrupt:
        print("Scheduler oprit manual.")
        sys.exit()
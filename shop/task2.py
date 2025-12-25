import schedule
import time
import os
import sys
from datetime import datetime

BACKUP_BAT = r"C:\Users\admin\OneDrive\Desktop\DJANGO PRACTICE\shop\aplicatie\backup.bat"
Z2 = "miercuri"
O2 = 14
DAYS_MAP = {
    "luni": 0,
    "marti": 1,
    "miercuri": 2,
    "joi": 3,
    "vineri": 4,
    "sambata": 5,
    "duminica": 6
}

def backup_baza_date():
    now = datetime.now()
    if now.weekday() == DAYS_MAP[Z2.lower()] and now.hour == O2:
        print("Incepem backup-ul bazei de date...")
        
        exit_code = os.system(f'"{BACKUP_BAT}"')
        
        if exit_code == 0:
            print("Backup realizat cu succes!")
        else:
            print("Eroare la backup. Cod: {exit_code}")
    else:
        pass

def run_scheduler():
    
    print(f"Scheduler backup pornit. Se va executa in fiecare {Z2} la ora {O2}:00.")
    
    schedule.every(1).minutes.do(backup_baza_date)

    while True:
        schedule.run_pending()
        time.sleep(60)

if __name__ == '__main__':
    try:
        run_scheduler()
    except KeyboardInterrupt:
        print("Scheduler oprit manual.")
        sys.exit()

from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime

from .models import Locatie

def index(request):
    return render(request, "aplicatie/index.html", {"ip": get_ip(request)})

def despre(request):
    return render(request, "aplicatie/despre.html", {"ip": get_ip(request)})

def in_lucru(request):
    return render(request, "aplicatie/in_lucru.html", {"ip": get_ip(request)})


ZILE = ["Luni","Marți","Miercuri","Joi","Vineri","Sâmbătă","Duminică"]
LUNI = ["Ianuarie","Februarie","Martie","Aprilie","Mai","Iunie","Iulie","August","Septembrie","Octombrie","Noiembrie","Decembrie"]

def afis_data(param):
    acum = datetime.now()
    zi_sapt = ZILE[acum.weekday()]
    zi = acum.day
    luna = acum.month
    an = acum.year
    ora = acum.strftime("%H:%M:%S")
    
    if param == "zi":
        continut = f"Data curentă este {zi} {LUNI[luna-1]} {an}."
    elif param == "timp":
        continut = f"Ora curenta este {ora}."
    else:
        continut = f"{zi_sapt}, {zi} {LUNI[luna-1]} {an}."
        
    return continut

def info(request):
    param_data = request.GET.get("data")
    continut_data = afis_data(param_data)
    parametri = request.GET
    
    nume_param = ', '.join(parametri.keys())
    
    return render(request, "aplicatie/info.html", {
        "continut_data": continut_data,
        "parametri": parametri,
        "numar_param": len(parametri),
        "nume_param": nume_param
    })
            

def get_ip(request):
    req_headers = request.META
    str_lista_ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if str_lista_ip:
        return str_lista_ip.split(',')[-1].strip()
    else:
        return request.META.get('REMOTE_ADDR') 
    
    
class Accesare:
    counter = 0

    def __init__(self, request):
        Accesare.counter += 1
        self.id = Accesare.counter
        self.ip_client = get_ip(request)
        self._url = request.get_full_path()
        self._data = datetime.now()

    def lista_parametri(self):
        return [
            ("id", self.id),
            ("ip_client", self.ip_client),
            ("url", self._url),
            ("data", self._data),
        ]

    def url(self):
        return self._url

    def data(self, paramFormat=None):
        if paramFormat:
            return self._data.strftime(paramFormat)
        return self._data

    def pagina(self):
        return self._url.split("?")[0] if self._url else None



ACCESARI = []

######################################################################

def log(request):
    ultimele = request.GET.get("ultimele")
    param_accesari = request.GET.get("accesari")
    param_dubluri = request.GET.get("dubluri", "false").lower()
    param_id = request.GET.getlist("iduri")
    param_tabel = request.GET.get("tabel")

    total = len(ACCESARI)

    # formatare accesari pentru template
    accesari_formatate = []
    for a in ACCESARI:
        accesari_formatate.append({
            'id': a.id,
            'ip_client': a.ip_client,
            'pagina': a.pagina(),
            'url': a.url(),
            'data': a.data('%Y-%m-%d %H:%M:%S')
        })

    # filtrare după ID-uri - SIMPLIFICAT
    id_list = []
    for elem in param_id:
        for x in elem.split(","):
            x = x.strip()
            if x.isdigit():
                val = int(x)
                if param_dubluri == "true" or val not in id_list:
                    id_list.append(val)

    # ultimele N accesari
    ultimele_accesari = []
    n = 0
    if ultimele:
        n = int(ultimele)
        ultimele_accesari = accesari_formatate[-n:] if n <= total else accesari_formatate

    # tabel
    coloane = []
    if param_tabel:
        coloane = ["id", "ip_client", "url", "data"] if param_tabel == "tot" else [c.strip() for c in param_tabel.split(",")]

    # paginile cel mai putin/mult accesate
    frecvente = {}
    pagina_min = None
    pagina_max = None
    if ACCESARI:
        for a in ACCESARI:
            frecvente[a.pagina()] = frecvente.get(a.pagina(), 0) + 1
        pagina_min = min(frecvente, key=frecvente.get)
        pagina_max = max(frecvente, key=frecvente.get)

    return render(request, "aplicatie/log.html", {
        "total": total,
        "param_accesari": param_accesari,
        "param_tabel": param_tabel,
        "coloane": coloane,
        "id_list": id_list,
        "ultimele_accesari": ultimele_accesari,
        "n": n,
        "ACCESARI": accesari_formatate,
        "pagina_min": pagina_min,
        "pagina_max": pagina_max,
        "frecventa_min": frecvente.get(pagina_min),
        "frecventa_max": frecvente.get(pagina_max)
    })


def afis_template(request):
    
    return render(request,"aplicatie/exemplu.html",
        {
            "titlu_tab":"Titlu fereastra",
            "titlu_articol":"Titlu afisat",
            "continut_articol":"Continut text"
        }
    )

def afis_lucruri(request):
    locatii=Locatie.objects.all()
    
    return render(request,"aplicatie/locatii.html",
        {
            "locatii":locatii[0],
            "nr_locatii":len(locatii)
        }
    )
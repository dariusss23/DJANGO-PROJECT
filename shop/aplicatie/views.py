from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime

import logging

logger = logging.getLogger('django')

from .models import Locatie

def index(request):
    logger.debug("Accesare pagina index")
    logger.info("Se afiseaza pagina index pentru utilizator")
    
    return render(request, "aplicatie/index.html", 
        {
            "ip": get_ip(request),
            "categorii": Categorie.objects.all(),
        }
    )

def despre(request):
    return render(request, "aplicatie/despre.html",
        {
            "ip": get_ip(request),
            "categorii": Categorie.objects.all()
        }
    )

def in_lucru(request):
    return render(request, "aplicatie/in_lucru.html",
        {
            "ip": get_ip(request),
            "categorii": Categorie.objects.all(),
        }
)


def get_ip(request):
    req_headers = request.META
    str_lista_ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if str_lista_ip:
        return str_lista_ip.split(',')[-1].strip()
    else:
        return request.META.get('REMOTE_ADDR') 

ZILE = ["Luni","Marti","Miercuri","Joi","Vineri","Sambata","Duminica"]
LUNI = ["Ianuarie","Februarie","Martie","Aprilie","Mai","Iunie","Iulie","August","Septembrie","Octombrie","Noiembrie","Decembrie"]

def afis_data(param):
    acum = datetime.now()
    zi_sapt = ZILE[acum.weekday()]
    zi = acum.day
    luna = acum.month
    an = acum.year
    ora = acum.strftime("%H:%M:%S")
    
    if param == "zi":
        continut = f"Data curenta este {zi} {LUNI[luna-1]} {an}."
    elif param == "timp":
        continut = f"Ora curenta este {ora}."
    else:
        continut = f"{zi_sapt}, {zi} {LUNI[luna-1]} {an}."
        
    return continut

def info(request):
    
    if not request.user.groups.filter(name='Administratori_site').exists():
        nr_403 = request.session.get('nr_403', 0) + 1
        request.session['nr_403'] = nr_403

        context = {
            "titlu": "Acces interzis - info",
            "mesaj_personalizat": "Nu ai voie sa accesezi pagina de info",
            "nr_403": nr_403,
            "N_MAX_403": 5,
        }
        return HttpResponseForbidden(render(request, "aplicatie/403.html", context))
    
    param_data = request.GET.get("data")
    continut_data = afis_data(param_data)
    parametri = request.GET
    
    nume_param = ', '.join(parametri.keys())
    
    return render(request, "aplicatie/info.html", {
        "continut_data": continut_data,
        "parametri": parametri,
        "numar_param": len(parametri),
        "nume_param": nume_param,
        "ip": get_ip(request)
    })
            
    
    
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
    
    if not request.user.groups.filter(name='Administratori_site').exists():
        nr_403 = request.session.get('nr_403', 0) + 1
        request.session['nr_403'] = nr_403

        context = {
            "titlu": "Acces interzis - log",
            "mesaj_personalizat": "Nu ai voie sa accesezi pagina de log",
            "nr_403": nr_403,
            "N_MAX_403": 5,
        }
        return HttpResponseForbidden(render(request, "aplicatie/403.html", context))
    
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
            "id": a.id,
            "ip_client": a.ip_client,
            "pagina": a.pagina(),
            "url": a.url(),
            "data": a.data('%Y-%m-%d %H:%M:%S')
        })

    # filtrare dupa ID-uri - SIMPLIFICAT
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
        "frecventa_max": frecvente.get(pagina_max),
        "ip": get_ip(request)
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
    
    
from django.shortcuts import redirect
from .forms import ContactForm

def contact_view(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():  
            nume = form.cleaned_data['nume']
            email = form.cleaned_data['email']
            mesaj = form.cleaned_data['mesaj']
            
            return redirect('mesaj_trimis')
    else:
        form = ContactForm()
        
    return render(request, 'aplicatie_exemplu/contact.html', 
        {
            'form': form,
            "categorii": Categorie.objects.all(),
            "ip": get_ip(request),
        })


from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .models import Ceas, Categorie
from .forms import CeasFilterForm

def afisare_ceasuri(request):
    nrPagina=request.GET.get("pagina")
    sortare=request.GET.get("sort", "a")
    
    produse = Ceas.objects.all().order_by('id_ceas')
    form=CeasFilterForm(request.GET)
    
    elemente_pe_pagina=5
    if form.is_valid():
        data=form.cleaned_data

        if data["model"]:
            produse=produse.filter(model__icontains=data["model"])
        if data["pret_min"] is not None:
            produse=produse.filter(pret__gte=data["pret_min"])
        if data["pret_max"] is not None:
            produse=produse.filter(pret__lte=data["pret_max"])
        if data["stoc_min"] is not None:
            produse=produse.filter(stoc__gte=data["stoc_min"])
        if data["stoc_max"] is not None:
            produse=produse.filter(stoc__lte=data["stoc_max"])
        if data["data_lansare_min"]:
            produse=produse.filter(data_lansare__gte=data["data_lansare_min"])
        if data["data_lansare_max"]:
            produse=produse.filter(data_lansare__lte=data["data_lansare_max"])
        if data["disponibil_online"] is True:
            produse=produse.filter(disponibil_online=True)
        if data["brand"]:
            produse=produse.filter(brand=data["brand"])
        if data["categorie"]:
            produse=produse.filter(categorie=data["categorie"])
        if data["material"]:
            produse=produse.filter(material=data["material"])
        if data["depozit"]:
            produse=produse.filter(depozit=data["depozit"])
        if data["promotii"]:
            produse=produse.filter(promotii=data["promotii"])
            
        elemente_pe_pagina=int(data.get("elemente_pe_pagina") or 5)

        mesaj_paginare=None
        if request.GET.get("elemente_pe_pagina") and int(request.GET.get("elemente_pe_pagina")) != 5:
            mesaj_paginare="In urma repaginarii e posibil sa fi sarit peste unele produse sau sa le vedeti din nou pe cele deja vizualizate."
            
            messages.info(request, "Numarul de produse pe pagina a fost modificat.")


    criteriu = "-pret" if sortare == "d" else "pret"
    
    disponibile = produse.filter(stoc__gt=0).order_by(criteriu)
    indisponibile = produse.filter(stoc=0).order_by(criteriu)
    
    produse = list(disponibile) + list(indisponibile)


    paginator=Paginator(produse, elemente_pe_pagina)
    mesajEroare=None

    try:
        obPagina=paginator.page(nrPagina)
    except PageNotAnInteger:
        obPagina=paginator.page(1)
    except EmptyPage:
        obPagina=paginator.page(paginator.num_pages)
        mesajEroare="Nu mai sunt produse"

    object_list=obPagina.object_list

    return render(request, "aplicatie/produse.html", {
        "object_list": object_list,
        "pagina": obPagina,
        "eroare": mesajEroare,
        "categorii": Categorie.objects.all(),
        "ip": get_ip(request),
        "form": form,
        "mesaj_paginare": mesaj_paginare
    })


from .models import Vizualizare    

def detalii_ceas(request, ceas_id):
    logger.debug(f"Intra in detalii_ceas cu ceas_id={ceas_id}")
    
    try:
        ceas = Ceas.objects.get(pk=ceas_id)
        logger.info(f"Ceas gasit: {ceas.model}")

        if request.user.id is not None:
            Vizualizare.objects.create(user=request.user, ceas=ceas)
            logger.debug(f"Vizualizare adaugata pentru user {request.user.username}")
            
            vizualizari = Vizualizare.objects.filter(user=request.user).order_by('-data')
            if len(vizualizari) > 5:
                for v in vizualizari[5:]:
                    v.delete()
                    
                messages.warning(request, "Istoricul tau vechi de vizualizare a fost sters automat (pastram doar ultimele 5).")
                
                logger.warning(f"S-au sters vizualizari vechi pentru user {request.user.username}")

        return render(request, "aplicatie/detalii_ceas.html", {
            "ceas": ceas,
            "ip": get_ip(request)
        })
    except Ceas.DoesNotExist:
        logger.error(f"Ceasul cu ID-ul {ceas_id} nu exista")
        return HttpResponse(f"Produsul cu ID-ul {ceas_id} nu exista.")
    except Ceas.MultipleObjectsReturned:
        logger.critical(f"Mai multe ceasuri cu ID-ul {ceas_id} in baza de date")
        return HttpResponse(f"Eroare: mai multe ceasuri cu ID-ul {ceas_id} in baza de date!")
    except Exception as e:
        return HttpResponse(f"Eroare neasteptata: {e}")


from .models import Categorie

def afisare_categorie(request, nume_categorie):
    categorie = Categorie.objects.get(stil_ceas=nume_categorie)
    produse = Ceas.objects.filter(categorie=categorie)
    
    get_params = request.GET.copy()
    get_params["categorie"] = categorie.pk
    
    form = CeasFilterForm(get_params)
    
    elemente_pe_pagina = 5
    mesajEroare = None
    mesaj_paginare = None
    
    categorie_din_form = request.GET.get("categorie")
    
    if categorie_din_form and categorie_din_form.isdigit():
        categorie_id_form = int(categorie_din_form)

        if categorie_id_form != categorie.pk:
            mesajEroare = "Categoria selectata nu corespunde cu pagina curenta. Filtrele au fost resetate."

            get_params = request.GET.copy()
            get_params["categorie"] = categorie.pk
            form = CeasFilterForm(get_params)

    else:
        if categorie_din_form:
            mesajEroare = "Valoare invalida pentru categorie. Filtrele au fost resetate."

        get_params = request.GET.copy()
        get_params["categorie"] = categorie.pk
        form = CeasFilterForm(get_params)
    
    if form.is_valid() and not mesajEroare:
        data = form.cleaned_data
        
        if data["model"]:
            produse = produse.filter(model__icontains=data["model"])
        if data["pret_min"] is not None:
            produse = produse.filter(pret__gte=data["pret_min"])
        if data["pret_max"] is not None:
            produse = produse.filter(pret__lte=data["pret_max"])
        if data["stoc_min"] is not None:
            produse = produse.filter(stoc__gte=data["stoc_min"])
        if data["stoc_max"] is not None:
            produse = produse.filter(stoc__lte=data["stoc_max"])
        if data["data_lansare_min"]:
            produse = produse.filter(data_lansare__gte=data["data_lansare_min"])
        if data["data_lansare_max"]:
            produse = produse.filter(data_lansare__lte=data["data_lansare_max"])
        if data["disponibil_online"] is True:
            produse = produse.filter(disponibil_online=True)
        if data["brand"]:
            produse = produse.filter(brand=data["brand"])
        if data["material"]:
            produse = produse.filter(material=data["material"])
        if data["depozit"]:
            produse = produse.filter(depozit=data["depozit"])
        if data["promotii"]:
            produse = produse.filter(promotii=data["promotii"])
            
        elemente_pe_pagina = int(data.get("elemente_pe_pagina") or 5)
        
        if request.GET.get("elemente_pe_pagina") and int(request.GET.get("elemente_pe_pagina")) != 5:
            mesaj_paginare = "In urma repaginarii e posibil sa fi sarit peste unele produse sau sa le vedeti din nou pe cele deja vizualizate."
    
    paginator = Paginator(produse, elemente_pe_pagina)
    nrPagina = request.GET.get("pagina", 1)

    try:
        obPagina = paginator.page(nrPagina)
    except PageNotAnInteger:
        obPagina = paginator.page(1)
    except EmptyPage:
        obPagina = paginator.page(paginator.num_pages)
        if not mesajEroare:
            mesajEroare = "Nu mai sunt produse"
            

    return render(request, "aplicatie/produse.html", {
        "pagina": obPagina,
        "object_list": obPagina.object_list,
        "eroare": mesajEroare,
        "categorie_selectata": categorie,
        "categorii": Categorie.objects.all(),
        "ip": get_ip(request),
        "form": form,
        "mesaj_paginare": mesaj_paginare
    })
    

from .forms import FormularContact, verifica_urgent_si_fisier, calcul_varsta, curata_mesaj, CAPS_dupa_terminatori
import os
import json
import time
from django.conf import settings
from datetime import datetime

def contact(request):
    mesaj_trimite=None
    urgent_flag=False

    if request.method=="POST":
        form=FormularContact(request.POST)

        if form.is_valid():
            data_nasterii=form.cleaned_data['data_nasterii']
            tip_mesaj=form.cleaned_data['tip_mesaj']
            zile=form.cleaned_data['minim_zile_asteptare']
            mesaj=form.cleaned_data['mesaj']

            varsta=calcul_varsta(data_nasterii)
            mesaj_curat=curata_mesaj(mesaj)
            mesaj_final=CAPS_dupa_terminatori(mesaj_curat)
            urgent_flag, _ =verifica_urgent_si_fisier(tip_mesaj, zile)

            # https://www.geeksforgeeks.org/python/python-os-path-join-method/
            folder=os.path.join(settings.BASE_DIR, "aplicatie", "Mesaje")
            timestamp=int(time.time())
            sufix="_urgent" if urgent_flag else ""
            nume_fisier=f"mesaj_{timestamp}{sufix}.json"
            cale_fisier=os.path.join(folder, nume_fisier)

            data_mesaj = {
                "nume": form.cleaned_data["nume"],
                "prenume": form.cleaned_data.get("prenume"),
                "cnp": form.cleaned_data.get("cnp"),
                "data_nasterii": str(data_nasterii),
                "email": form.cleaned_data["email"],
                "tip_mesaj": tip_mesaj,
                "subiect": form.cleaned_data["subiect"],
                "minim_zile_asteptare": zile,
                "mesaj": mesaj_final,
                "urgent": urgent_flag,
                "ip": get_ip(request),
                "moment": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "timestamp": timestamp
            }

            with open(cale_fisier, "w", encoding="utf-8") as f:
                json.dump(data_mesaj, f, ensure_ascii=False, indent=4)
                
            messages.success(request, "Mesajul tau a fost trimis si salvat cu succes!")

            mesaj_trimite = (
                f"Mesajul a fost trimis cu succes!\n"
                f"Varsta: {varsta}\n"
                f"Nume fisier: {nume_fisier}\n"
                f"Urgent: {urgent_flag}\n"
                f"Mesaj procesat: {mesaj_final}"
            )

            form = FormularContact()
    else:
        form = FormularContact()

    return render(request, "aplicatie/contact.html", {
        "form": form,
        "mesaj_trimite": mesaj_trimite
    })
    
    
from django.shortcuts import render, redirect
from django.utils import timezone
from .forms import AdaugareCeas
from .models import Ceas

def get_urmatorul_id_sugerat():
    cel_mai_mare_ceas = Ceas.objects.order_by('-id_ceas').first()
    
    if cel_mai_mare_ceas is None:
        return 1
    
    return cel_mai_mare_ceas.id_ceas + 1

def adauga_ceas(request):
    
    if not request.user.has_perm('aplicatie.add_ceas'):
        nr_403 = request.session.get('nr_403', 0) + 1
        request.session['nr_403'] = nr_403

        context = {
            "titlu": "Eroare adaugare produse",
            "mesaj_personalizat": "Nu ai voie sa adaugi ceasuri",
            "nr_403": nr_403,
            "N_MAX_403": 5,
        }
        return HttpResponseForbidden(render(request, "aplicatie/403.html", context))
    
    mesaj = None
    id_sugerat_pentru_context = get_urmatorul_id_sugerat()

    if request.method == "POST":
        form = AdaugareCeas(request.POST)
        if form.is_valid():
            try:
                ceas = form.save(commit=False)

                pret_final_calculat = form.cleaned_data.get('pret')
                ceas.pret = pret_final_calculat
                ceas.data_lansare = timezone.now().date()
                ceas.disponibil_online = True

                ceas.save()
                
                messages.success(request, f"Ceasul '{ceas.model}' a fost adaugat cu SUCCES!")

                mesaj = f"Ceasul '{ceas.model}' a fost adaugat cu succes! Pret final: {pret_final_calculat} RON"
                
                id_sugerat_pentru_context = get_urmatorul_id_sugerat()
                
                form = AdaugareCeas()

            except Exception as e:
                subject = "Eroare la adaugarea unui ceas"
                message_text = f"A aparut o eroare:\n{str(e)}"
                message_html = f"""
                    <div style="background-color:red; padding:10px;">
                        <h2>Eroare!</h2>
                        <p>{str(e)}</p>
                    </div>
                """
                mail_admins(subject, message_text, html_message=message_html)

                mesaj = "A aparut o eroare neasteptata. Administratorii au fost notificati."

    else:
        form = AdaugareCeas()

    return render(request, "aplicatie/adauga_ceas.html", {
        "form": form,
        "mesaj": mesaj,
        "id_sugerat": id_sugerat_pentru_context,
        "categorii": Categorie.objects.all(),
    })


from django.contrib.auth import login
from .forms import CustomAuthenticationForm

import time
from django.core.mail import mail_admins
from django.contrib.auth import login
from .forms import CustomAuthenticationForm


def custom_login_view(request):
    ip = get_ip(request)
    now = time.time()
    
    logger.debug("Accesare pagina login")

    if "login_attempts" not in request.session:
        request.session["login_attempts"] = []

    recent_attempts = [t for t in request.session["login_attempts"] if now - t < 120]
    request.session["login_attempts"] = recent_attempts

    if request.method == 'POST':
        form = CustomAuthenticationForm(data=request.POST, request=request)
        
        username=request.POST.get("username")
        logger.info(f"Se incearca autentificarea pentru user {username}")

        if form.is_valid():
            user = form.get_user()
            
            if user.blocat:
                messages.error(request, "Contul tau a fost blocat. Nu te poti autentifica.")
                return render(request, 'aplicatie/login.html', {'form': form, "ip": ip})
            
            if not user.email_confirmat:
                messages.error(request, "Trebuie sa iti confirmi mai intai adresa de email!")
                return render(request, 'aplicatie/login.html', {'form': form, "ip": ip})
            
            login(request, user)
            logger.info(f"User {username} s-a logat cu succes")

            request.session["login_attempts"] = []

            if form.cleaned_data.get('ramane_logat'):
                request.session.set_expiry(24 * 60 * 60)
            else:
                request.session.set_expiry(0)

            request.session['username'] = user.username
            request.session['email'] = user.email
            request.session['tara'] = user.tara
            request.session['oras'] = user.oras
            request.session['adresa'] = user.adresa
            request.session['puncte_loialitate'] = user.puncte_loialitate
            request.session['cont_premium'] = user.cont_premium
            
            request.session['is_admin_site'] = user.groups.filter(name="Administratori_site").exists()
            request.session['is_admin_produse'] = user.groups.filter(name="Administratori_produse").exists()

            return redirect('profil')

        else:
            recent_attempts.append(now)
            request.session["login_attempts"] = recent_attempts

            username_incercat = request.POST.get("username")
            
            messages.warning(request, f"Date incorecte pentru userul {username_incercat}. Mai ai putine incercari!")
            
            logger.warning(f"Autentificare esuata pentru {username_incercat}")

            if len(recent_attempts) >= 3:
                
                logger.error(f"3 incercari esuate consecutive pentru {username_incercat} de la IP {get_ip(request)}")
                
                subject = "Logari suspecte"
                text_message = (
                    "Au fost detectate 3 incercari esuate de logare.\n"
                    f"Username incercat: {username_incercat}\n"
                    f"IP: {ip}\n"
                )
                html_message = f"""
                    <h1 style="color:red;">{subject}</h1>
                    <p><b>Username incercat:</b> {username_incercat}</p>
                    <p><b>IP:</b> {ip}</p>
                """

                mail_admins(
                    subject=subject,
                    message=text_message,
                    html_message=html_message
                )

    else:
        form = CustomAuthenticationForm()

    return render(request, 'aplicatie/login.html', {'form': form, "ip": get_ip(request)})



from django.contrib.auth import logout

def logout_view(request):
    
    try:
        from django.contrib.auth.models import Permission
        perm = Permission.objects.get(codename='vizualizeaza_oferta')
        request.user.user_permissions.remove(perm)
    except Permission.DoesNotExist:
        pass

    
    logout(request)
    
    messages.info(request, "Te-ai delogat cu succes. Te asteptam sa revii!")
    
    return redirect('index')

def profile_view(request):
    context = {
        'username': request.session.get('username'),
        'email': request.session.get('email'),
        'tara': request.session.get('tara'),
        'oras': request.session.get('oras'),
        'adresa': request.session.get('adresa'),
        'puncte_loialitate': request.session.get('puncte_loialitate'),
        'cont_premium': request.session.get('cont_premium'),
        'ip' : get_ip(request),
    }
    return render(request, 'aplicatie/profile.html', context)

from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages

def change_password_view(request):
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, request.user)
            messages.success(request, 'Parola a fost actualizata cu succes.')
            return redirect('profile')
        else:
            messages.error(request, 'Exista erori in formular.')
    else:
        form = PasswordChangeForm(user=request.user)
    return render(request, 'aplicatie/change_password.html', {'form': form})


from .forms import CustomUserCreationForm
from django.template.loader import render_to_string
from django.core.mail import EmailMessage

def register_view(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            email = form.cleaned_data.get("email")
            
            if username.lower()=="admin":
                
                messages.error(request, "Nu ai voie sa folosesti numele de utilizator 'admin'!")
                
                subject_alert = "cineva incearca sa ne preia site-ul"
                message_text = f"Cineva a încercat sa se înregistreze cu username-ul 'admin'.\nEmail: {email}"
                message_html = f"""
                    <h1 style="color:red;">{subject_alert}</h1>
                    <p>Email introdus: {email}</p>
                """
                mail_admins(
                    subject=subject_alert,
                    message=message_text,
                    html_message=message_html
                )
                
                return render(request, 'aplicatie/signin.html', {
                    'form': form,
                    'eroare': "Username-ul 'admin' nu este permis!"
                })
            
            
            user = form.save() 
            
            subject = 'Confirmare Inregistrare pe Site'
            
            html_message = render_to_string('aplicatie/confirmare_mail.html', {'user': user})
            
            send_mail(
                subject=subject,
                message="Verificare cont",
                from_email='django14008@gmail.com',
                recipient_list=[user.email],
                html_message=html_message,
                fail_silently=False,
            )
            
            
            return redirect('login')
    else:
        form = CustomUserCreationForm()
    
    return render(request, 'aplicatie/signin.html', {'form': form})



from django.core.mail import send_mail

'''
def trimite_email():
    send_mail(
        subject='Salutare Sava Darius-Stefan grupa 242!',
        message='Salut. Ma numesc Sava Darius-Stefan, grupa 242?',
        html_message='<h1>Salut</h1><p>Sava Darius Stefan grupa 242?</p>',
        from_email='adresa_email@gmail.com',
        recipient_list=['test.tweb.node@gmail.com'],
        fail_silently=False,
    )
''' 

from .models import CustomUser 

def confirma_mail_view(request, cod_activare):
    try:
        user = CustomUser.objects.get(cod=cod_activare)
    except CustomUser.DoesNotExist:
        
        logger.critical(f"Cod de activare invalid: {cod_activare}")
        
        mesaj = "Linkul de activare este invalid sau a expirat. Te rugam sa verifici adresa URL."
        return render(request, 'aplicatie/mesaj_simplu.html', {'mesaj': mesaj})
    
    if user.email_confirmat:
        mesaj = f"Adresa de e-mail pentru utilizatorul {user.username} a fost deja confirmata. Te poti autentifica."
    else:
        user.email_confirmat = True
        user.cod = None
        user.save()
        
        mesaj = f"Felicitari, {user.username}! Adresa ta de e-mail a fost confirmata cu succes. Poti sa te autentifici acum."

    return render(request, 'aplicatie/mesaj_simplu.html', {'mesaj': mesaj})


from .forms import OfertaForm

from django.core.mail import send_mass_mail

def promotii_view(request):
    K=3

    if request.method == 'POST':
        form = OfertaForm(request.POST)
        if form.is_valid():
            oferta = form.save()

            categorii_selectate = oferta.categorii.all()

            emailuri_de_trimis = []

            for categorie in categorii_selectate:
                ceasuri = Ceas.objects.filter(categorie=categorie)

                vizualizari = []
                for ceas in ceasuri:
                    vizualizari.extend(Vizualizare.objects.filter(ceas=ceas))

                contor = {}

                for v in vizualizari:
                    user = v.user
                    if user not in contor:
                        contor[user] = 0
                    contor[user] += 1

                useri_eligibili = []
                for user, nr in contor.items():
                    if nr >= K:
                        useri_eligibili.append(user.email)

                if not useri_eligibili:
                    continue

                subiect = oferta.subiect_email
                
                if oferta.fisier_template == 'oferta_standard.txt':
                    template_fisier = 'email/oferta_standard.txt'
                elif oferta.fisier_template == 'oferta_urgenta.txt':
                    template_fisier = 'email/oferta_urgenta.txt'
                
                mesaj = render_to_string(template_fisier, {
                    'categorie': categorie.nume,
                    'procent': oferta.procent_reducere,
                    'data_expirare': oferta.data_expirare,
                })

                email_expeditor = "django14008@gmail.com"

                emailuri_de_trimis.append(
                    (subiect, mesaj, email_expeditor, useri_eligibili)
                )

            if emailuri_de_trimis:
                send_mass_mail(emailuri_de_trimis)

            return redirect('promotii_view')

    else:
        form = OfertaForm()

    return render(request, 'aplicatie/promotii.html', {'form': form})



from django.http import HttpResponse, HttpResponseForbidden
from django.shortcuts import render
from django.conf import settings

def interzis(request):
    nr = request.session.get("nr_403", 0) + 1
    request.session["nr_403"] = nr

    context = {
        "titlu": "",
        "mesaj_personalizat": "Nu ai permisiunea necesara pentru a accesa aceasta resursa.",
        "nr_403": nr,
        "N_MAX_403": settings.N_MAX_403,
    }

    return HttpResponseForbidden(render(request, '403.html', context))

'''
from aplicatie.models import CustomUser
from django.contrib.auth.models import Group, Permission

grup = Group.objects.create(name='Administratori_produse')

grup.permissions.add(
    Permission.objects.get(codename='add_ceas'),
    Permission.objects.get(codename='change_ceas'),
    Permission.objects.get(codename='delete_ceas'),
    Permission.objects.get(codename='view_ceas')
)

user = CustomUser.objects.get(username='USER_DJANGO')
user.groups.add(grup)

'''

'''
from aplicatie.models import CustomUser
from django.contrib.auth.models import Group

group = Group.objects.get(name='Administratori_site')

user = CustomUser.objects.get(username="USER_TEST")

user.groups.add(group)

'''

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import Permission


def acorda_permisiune_oferta(request):
    perm = Permission.objects.get(codename='vizualizeaza_oferta')
    request.user.user_permissions.add(perm)
    return redirect('oferta')

def oferta_view(request):
    if not request.user.has_perm('aplicatie.vizualizeaza_oferta'):
        nr_403 = request.session.get('nr_403', 0) + 1
        request.session['nr_403'] = nr_403

        context = {
            "titlu": "Eroare afisare oferta",
            "mesaj_personalizat": "Nu ai voie sa vizualizezi oferta",
            "nr_403": nr_403,
            "N_MAX_403": 5,
        }
        return HttpResponseForbidden(render(request, 'aplicatie/403.html', context))

    return render(request, 'aplicatie/oferta.html', {
        'mesaj': "Felicitari! Ai acces la oferta speciala de reducere 50%!",
        'ip': get_ip(request)
    })


'''

from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType
from aplicatie.models import CustomUser


moderatori = Group.objects.create(name='Moderatori')

perm_vizualizare = Permission.objects.get(codename='view_customuser')
perm_editare = Permission.objects.get(codename='change_customuser')

moderatori.permissions.add(perm_vizualizare, perm_editare)


------------------------------------------------------------------------------------


from django.contrib.auth.models import Group
from aplicatie.models import CustomUser


moderatori = Group.objects.get(name='Moderatori')

user = CustomUser.objects.get(username='MODERATOR_1')

user.groups.add(moderatori)

'''

from weasyprint import HTML

from .models import Comanda, ProdusComanda

def fisier_pdf(request, cos_date, user):
    try:
        produse_factura = []
        total_final = 0
        total_obiecte = 0

        for id_ceas, cantitate in cos_date.items():
            ceas = Ceas.objects.get(id_ceas=id_ceas)
            pret_partial = ceas.pret * int(cantitate)
            total_final += pret_partial
            total_obiecte += int(cantitate)

            produse_factura.append({
                'model': ceas.model,
                'brand': ceas.brand.nume,
                'pret_unitar': ceas.pret,
                'cantitate': cantitate,
                'pret_partial': pret_partial,
                'link': request.build_absolute_uri(f"/detalii_ceas/{ceas.id_ceas}/")
            })
            
        cale_folder = os.path.join(settings.BASE_DIR, "temporar-facturi", user.username)
        print(f"DEBUG: Incerc sa creez folderul la adresa: {cale_folder}")
        if not os.path.exists(cale_folder):
            os.makedirs(cale_folder)

        timestamp = int(time.time())
        nume_fisier = f"factura-{timestamp}.pdf"
        cale_completa = os.path.join(cale_folder, nume_fisier)

        cod_html = render_to_string('aplicatie/factura_pdf.html', {
            'produse': produse_factura,
            'total_final': total_final,
            'total_obiecte': total_obiecte,
            'data_comanda': timezone.now(),
            'user': user,
            'admin_email': 's.darius14008@gmail.com'
        })

        html_obj = HTML(string=cod_html)
        html_obj.write_pdf(cale_completa)
        return cale_completa
    except Exception as e:
        import traceback
        print("--- EROARE GENERARE PDF ---")
        print(traceback.format_exc())
        return None

def trimite_mail_pdf(request, cos_date):
    user = request.user
    cale_pdf = fisier_pdf(request, cos_date, user)
    
    if cale_pdf:
        email = EmailMessage(
            subject='Factura Comanda Ta',
            body=f'Buna ziua {user.first_name}, factura este atasata.',
            to=[user.email]
        )
        email.attach_file(cale_pdf)
        email.send()

def proceseaza_date(request):
    if request.method == "POST":
        date_primite = json.loads(request.body.decode('utf-8'))
        cos_date = date_primite.get("comanda_data", {})

        noua_comanda = Comanda.objects.create(
            user=request.user,
            curier="Curier Rapid",
            comanda_rapida=False
        )

        for id_ceas, cantitate in cos_date.items():
            ceas = Ceas.objects.get(id_ceas=id_ceas)
            ProdusComanda.objects.create(
                comanda=noua_comanda, 
                ceas=ceas, 
                cantitate=cantitate
            )

        # Generare PDF și trimitere
        trimite_mail_pdf(request, cos_date)
        return HttpResponse("OK")


def pagina_cos(request):
    toate_produsele = Ceas.objects.all()
    
    return render(request, "aplicatie/cos_final.html", {
        "produse": toate_produsele,
        "categorii": Categorie.objects.all(),
        "ip": get_ip(request)
    })
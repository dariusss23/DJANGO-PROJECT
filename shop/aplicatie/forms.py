from django import forms

class ContactForm(forms.Form):
    nume = forms.CharField(max_length=100, label='Nume', required=True)
    email = forms.EmailField(label='Email', required=True)
    mesaj = forms.CharField(widget=forms.Textarea, label='Mesaj', required=True)

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if not email.endswith('@domeniu.com'):
            raise forms.ValidationError("Adresa de email trebuie sa fie de la domeniu.com")
        return email

    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        confirm_email = cleaned_data.get("confirm_email")
        if email and confirm_email and email != confirm_email:
            raise forms.ValidationError("Adresele de email nu coincid.")
        
from .models import Brand, Categorie, Material, Depozit, Promotie

class CeasFilterForm(forms.Form):
    model = forms.CharField(required=False, label="Model")
    pret_min = forms.DecimalField(required=False, min_value=0, label="Pret minim")
    pret_max = forms.DecimalField(required=False, min_value=0, label="Pret maxim")
    stoc_min = forms.IntegerField(required=False, min_value=0, label="Stoc minim")
    stoc_max = forms.IntegerField(required=False, min_value=0, label="Stoc maxim")
    data_lansare_min = forms.DateField(required=False, label="Data lansare de la")
    data_lansare_max = forms.DateField(required=False, label="Data lansare pana la")
    disponibil_online = forms.BooleanField(required=False, label="Disponibil online")
    brand = forms.ModelChoiceField(queryset=Brand.objects.all(), required=False)
    categorie = forms.ModelChoiceField(queryset=Categorie.objects.all(), required=False)
    material = forms.ModelChoiceField(queryset=Material.objects.all(), required=False)
    depozit = forms.ModelChoiceField(queryset=Depozit.objects.all(), required=False)
    promotii = forms.ModelChoiceField(queryset=Promotie.objects.all(), required=False)
    
    NUMAR_ELEMENTE_PAGINA = [
        (5, "-------------------"),
        (10, "10 produse pe pagina"),
        (20, "20 produse pe pagina"),
        (50, "50 produse pe pagina"),
        (100, "100 produse pe pagina"),
    ]
    
    elemente_pe_pagina = forms.ChoiceField(choices=NUMAR_ELEMENTE_PAGINA,label="Produse per pagina",required=False)


    def clean(self):
        cleaned_data = super().clean()

        pret_min = cleaned_data.get("pret_min")
        pret_max = cleaned_data.get("pret_max")
        stoc_min = cleaned_data.get("stoc_min")
        stoc_max = cleaned_data.get("stoc_max")
        data_min = cleaned_data.get("data_lansare_min")
        data_max = cleaned_data.get("data_lansare_max")

        if pret_min is not None and pret_max is not None:
            if pret_min > pret_max:
                self.add_error("pret_max", "Pretul maxim trebuie sa fie mai mare sau egal cu pretul minim.")

        if stoc_min is not None and stoc_max is not None:
            if stoc_min > stoc_max:
                self.add_error("stoc_max", "Stocul maxim trebuie sa fie mai mare sau egal cu stocul minim.")

        if data_min and data_max:
            if data_min > data_max:
                self.add_error("data_lansare_max", "Data lansarii trebuie sa fie dupa sau egala cu data de inceput.")

        return cleaned_data


from django import forms
from datetime import date, datetime
from django.core.exceptions import ValidationError
import re

def validare_varsta(data_nasterii):
    azi=date.today()
    varsta=azi.year - data_nasterii.year - ((azi.month, azi.day) < (data_nasterii.month, data_nasterii.day))
    if varsta<18:
        raise ValidationError("Trebuie sa fiti major (minim 18 ani).")

# CURS 2 (EXPRESII REGULATE) 
# /w - orice caracter alfanumeric (litere, cifre, underscore), echivalent cu [a-zA-Z0-9_]
def contor_cuvinte_mesaj(value):
    cuvinte=re.findall(r'\w+', value)
    nr_cuvinte=len(cuvinte)

    if nr_cuvinte<5 or nr_cuvinte>100:
        raise ValidationError(f"Mesajul trebuie sa contina intre 5 si 100 de cuvinte (acum are {nr_cuvinte}).")
    
    for cuv in cuvinte:
        if len(cuv)>15:
            raise ValidationError(f"Cuvantul „{cuv}” este prea lung (maxim 15 caractere permise).")
        
def validate_no_links(value):
    cuvinte=value.split()

    for cuv in cuvinte:
        if cuv.lower().startswith('http://') or cuv.lower().startswith('https://'):
            raise ValidationError("Textul nu poate contine linkuri (http:// sau https://).")
        

def validate_cnp(value):
    if not value:
        return
    
    if not value.isdigit():
        raise ValidationError("CNP-ul trebuie sa contina doar cifre.")
    
    if value[0] not in ('1', '2'):
        raise ValidationError("CNP-ul trebuie sa inceapa cu 1 sau 2.")
    
    yy = int(value[1:3])
    mm = int(value[3:5])
    dd = int(value[5:7])

    an=1900+yy
    try:
        datetime(an, mm, dd)
    except ValueError:
        raise ValidationError("CNP-ul contine o data incorecta (zile/luni invalide).")
    
    
TEMP_EMAIL_DOMAINS = ['guerillamail.com', 'yopmail.com']

def validare_email_temporar(value):
    try:
        email_split=value.split('@')
        domain=email_split[1].lower()
    except IndexError:
        raise ValidationError("E-mailul trebuie sa fie valid.")

    if domain in TEMP_EMAIL_DOMAINS:
        raise ValidationError(f"E-mailul cu domeniul '{domain}' nu este permis.")
    
# CURS 2 (EXPRESII REGULATE) 
# $ - sfarsitul sirului
# * - zero sau mai multe aparitii ale unui caracter sau grup
# ^ - inceputul sirului

#([ -][a-z]) → combina cele doua: cauta un spatiu sau liniuta urmat de litera mica

def incepe_cu_majuscula(value):
    if not value:
        return
    
    if not re.match(r'^[A-Z][a-zA-Z -]*$', value):
        raise ValidationError("Trebuie sa inceapa cu litera mare si sa contina doar litere, spatii si cratime.")
    
def majuscula_dupa_spatiu_liniuta(value):
    if not value:
        return

    if re.search(r'([ -][a-z])', value):
        raise ValidationError("Dupa spatiu sau cratima trebuie sa urmeze litera mare.")
    
def calcul_varsta(data_nasterii):
    azi=date.today()
    ani=azi.year - data_nasterii.year
    luni=azi.month - data_nasterii.month
    if azi.day<data_nasterii.day:
        luni-=1
        
    if luni<0:
        ani-=1
        luni+=12
    return f"{ani} ani si {luni} luni"

# CURS 2 (EXPRESII REGULATE)
# \s - orice spatiu alb (inclusiv spatiu, tab, newline)
#  + - una sau mai multe aparitii ale unui caracter sau grup

def curata_mesaj(mesaj):
    return re.sub(r'\s+', ' ', mesaj).strip()

def CAPS_dupa_terminatori(text):
    rezultat=""
    urmatoarea_mare=True
    
    i=0
    while i<len(text):
        c=text[i]
        if urmatoarea_mare and c.isalpha():
            rezultat+=c.upper()
            urmatoarea_mare=False
        else:
            rezultat+=c
        
        if text[i:i+3]=='...':
            urmatoarea_mare=True
            i+=2 
        elif c in '.!?':
            urmatoarea_mare=True
        
        i+=1
    
    return rezultat


def verifica_urgent_si_fisier(tip_mesaj, zile):
    if tip_mesaj in ["review", "cerere"]:
        minim_zile=4
    elif tip_mesaj in ["intrebare", "cerere"]:
        minim_zile=2
    else:
        minim_zile=1

    urgent=False
    nume_fisier=f"mesaj_{tip_mesaj}.txt"

    if zile==minim_zile:
        urgent=True
        nume_fisier=f"mesaj_{tip_mesaj}_urgent.txt"

    return urgent, nume_fisier


class FormularContact(forms.Form):
    TIPURI_MESAJ = [
        ('neselectat', 'Neselectat'),
        ('reclamatie', 'Reclamatie'),
        ('intrebare', 'Intrebare'),
        ('review', 'Review'),
        ('cerere', 'Cerere'),
        ('programare', 'Programare'),
    ]

    nume = forms.CharField(label="Nume", max_length=10, required=True,validators=[incepe_cu_majuscula, majuscula_dupa_spatiu_liniuta])
    prenume = forms.CharField(label="Prenume", max_length=10, required=False,validators=[incepe_cu_majuscula, majuscula_dupa_spatiu_liniuta])
    cnp = forms.CharField(label="CNP", max_length=13, min_length=13, required=False, validators=[validate_cnp])
    data_nasterii = forms.DateField(label="Data nasterii", required=True, validators=[validare_varsta], input_formats=['%d/%m/%Y', '%Y-%m-%d'])
    email = forms.EmailField(label="E-mail", required=True, validators=[validare_email_temporar])
    confirmare_email = forms.EmailField(label="Confirmare E-mail", required=True)
    tip_mesaj = forms.ChoiceField(label="Tip mesaj", choices=TIPURI_MESAJ, required=True, initial='neselectat')
    subiect = forms.CharField(label="Subiect", max_length=100, required=True, validators=[incepe_cu_majuscula])
    minim_zile_asteptare = forms.IntegerField(label="Minim zile asteptare", required=True, min_value=1, max_value=30, help_text="Pentru review-uri/cereri minimul de zile de asteptare trebuie setat de la 4 incolo iar pentru cereri/intrebari de la 2 incolo. Maximul e 30.")
    mesaj = forms.CharField(label="Mesaj (va rugam sa va semnati la final)",widget=forms.Textarea, required=True, validators=[contor_cuvinte_mesaj])


    def clean(self):
        cleaned_data = super().clean()
        email = cleaned_data.get("email")
        confirmare_email = cleaned_data.get("confirmare_email")
        tip_mesaj = cleaned_data.get("tip_mesaj")
        zile = cleaned_data.get("minim_zile_asteptare")
        mesaj = cleaned_data.get("mesaj")
        nume = cleaned_data.get("nume")
        cnp = cleaned_data.get("cnp")
        data_nasterii = cleaned_data.get("data_nasterii")
            
        if tip_mesaj=="neselectat":
            raise ValidationError({
                'tip_mesaj': "Trebuie selectat un tip de mesaj valid."
            })

        if email and confirmare_email and email != confirmare_email:
            raise ValidationError({
                "confirmare_email": "Emailurile nu coincid."
            })
            
        if mesaj and nume:
            ultimul_cuv = mesaj.strip().split()[-1]
            if ultimul_cuv != nume:
                raise ValidationError({
                    "mesaj": "Mesajul trebuie sa se incheie cu numele dvs. (semnatura)."
                })

        if tip_mesaj in ["review", "cerere"] and zile is not None and zile < 4:
            raise ValidationError({
                "minim_zile_asteptare": "Pentru review-uri/cereri trebuie minim 4 zile."
            })
        elif tip_mesaj in ["intrebare", "cerere"] and zile is not None and zile < 2:
            raise ValidationError({
                "minim_zile_asteptare": "Pentru intrebari/cereri trebuie minim 2 zile."
            })
            
        if cnp and data_nasterii:
            yy_cnp=int(cnp[1:3])
            mm_cnp=int(cnp[3:5])
            dd_cnp=int(cnp[5:7])
            an_cnp=1900+yy_cnp
            if (data_nasterii.year!=an_cnp or data_nasterii.month!=mm_cnp or data_nasterii.day!=dd_cnp):
                raise ValidationError({
                    "cnp": "CNP-ul nu corespunde cu data nasterii."
                })
            
        
from .models import Ceas

def validator_valoare_pozitiva(value):
    if value < 0:
        raise ValidationError("Valoarea nu poate fi negativa (minim 0).")


def validator_stoc_max(value):
    if value > 500:
        raise ValidationError("Stocul nu poate depasi 500 de bucati in sistem.")


class AdaugareCeas(forms.ModelForm):
    pret_baza = forms.DecimalField(
        label="Pret de achizitie (lei)",
        max_digits=10,
        decimal_places=2,
        help_text="Introduceti pretul de cumparare de la furnizor.",
        validators=[validator_valoare_pozitiva],
        error_messages={
            'required': "Introduceti un pret de achizitie.",
            'min_value': "Pretul de baza trebuie sa fie pozitiv.",
            'invalid': "Introduceti un numar valid pentru pret."
        }
    )

    adaos_procent = forms.DecimalField(
        label="Adaos comercial (%)",
        max_digits=5,
        decimal_places=2,
        min_value=0,
        help_text="Introduceti procentul de adaos (ex: 20 pentru 20%).",
        error_messages={
            'required': "Introduceti un procent de adaos comercial.",
            'min_value': "Adaosul comercial nu poate fi negativ.",
            'invalid': "Introduceti o valoare numerica valida pentru adaos."
        }
    )


    stoc = forms.IntegerField(
        label="Numar produse In stoc",
        validators=[validator_valoare_pozitiva, validator_stoc_max],
        error_messages={
            'required': "Introduceti numarul de produse din stoc.",
            'invalid': "Valoarea introdusa pentru stoc nu este valida (numar intreg)."
        }
    )

    class Meta:
        model = Ceas
        fields = ['id_ceas', 'model', 'stoc', 'brand', 'categorie', 'material', 'colorCode']
        labels = {
            'id_ceas': 'ID Ceas',
            'model': 'Modelul ceasului',
            'stoc': 'Numar produse in stoc',
            'brand': 'Selecteaza Brandul',
            'categorie': 'Selecteaza Categoria',
            'material': 'Selecteaza Materialul',
            'colorCode': 'Cod Culoare (ex: #FFFFFF)'
        }
        error_messages = {
            'id_ceas': {
                'required': "ID-ul ceasului este obligatoriu.",
                'invalid': "Introduceti un ID valid (de obicei, un numar)."
            },
            'model': {
                'required': "Numele modelului este obligatoriu.",
                'max_length': "Numele modelului este prea lung.",
            },
            'brand': {
                'required': "Trebuie sa selectezi un brand."
            },
            'categorie': {
                'required': "Trebuie sa selectezi o categorie."
            },
            'material': {
                'required': "Trebuie sa selectezi un material."
            }
        }


    def clean_model(self):
        model = self.cleaned_data.get('model')
        if not model:
            raise ValidationError("Introduceti un nume de model valid.")
        if not model[0].isupper():
            raise ValidationError("Modelul trebuie sa inceapa cu litera mare.")
        if len(model) < 3:
            raise ValidationError("Modelul trebuie sa aiba cel putin 3 caractere.")
        return model


    def clean_pret_baza(self):
        pret_baza = self.cleaned_data.get('pret_baza')
        if pret_baza is not None and pret_baza < 10:
            raise ValidationError("Pretul de baza trebuie sa fie de cel putin 10 lei.")
        return pret_baza
    

    def clean_id_ceas(self):
        id_introdus = self.cleaned_data.get('id_ceas')
        if Ceas.objects.filter(id_ceas=id_introdus).exists():
            raise ValidationError("Acest ID exista deja. Va rugam introduceti altul.")
        return id_introdus


    def clean(self):
        cleaned_data = super().clean()
        pret_baza = cleaned_data.get('pret_baza')
        adaos_procent = cleaned_data.get('adaos_procent')

        if pret_baza and adaos_procent:
            if adaos_procent > 200:
                raise ValidationError("Adaosul comercial nu poate depasi 200%.")
            if pret_baza < 50 and adaos_procent > 100:
                raise ValidationError(
                    "Produsele cu pret mic nu pot avea adaos mai mare de 100%."
                )

            cleaned_data['pret'] = round(pret_baza + pret_baza * adaos_procent / 100, 2)

        return cleaned_data
    

from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser

class CustomUserCreationForm(UserCreationForm):
    telefon = forms.CharField(required=True)
    oras = forms.CharField(required=True)
    puncte_loialitate = forms.IntegerField(required=False, min_value=0)
    tara = forms.CharField(required=False)
    adresa = forms.CharField(required=False)
    cont_premium = forms.BooleanField(required=False)

    class Meta:
        model = CustomUser
        fields = ("username", "email", "telefon", "tara", "oras", "adresa", "puncte_loialitate", "cont_premium", "password1", "password2")


    def clean_telefon(self):
        telefon = self.cleaned_data.get("telefon")
        if not telefon.isdigit() or len(telefon) < 9:
            raise forms.ValidationError("Telefonul trebuie sa aiba minim 9 cifre si sa contina doar cifre.")
        return telefon

    def clean_oras(self):
        oras = self.cleaned_data.get("oras", "").strip()
        if len(oras) < 3:
            raise forms.ValidationError("Orasul trebuie sa aiba cel putin 3 litere.")
        for char in oras:
            if char.isdigit():
                raise forms.ValidationError("Orasul nu trebuie sa contina cifre.")

        return oras

    def clean_puncte_loialitate(self):
        puncte = self.cleaned_data.get("puncte_loialitate") or 0
        if puncte < 0 or puncte % 5 != 0:
            raise forms.ValidationError("Punctele de loialitate trebuie sa fie multiplu de 5 si >= 0.")
        return puncte

    def save(self, commit=True):
        user = super().save(commit=False)
        user.telefon = self.cleaned_data["telefon"]
        user.oras = self.cleaned_data["oras"]
        user.puncte_loialitate = self.cleaned_data.get("puncte_loialitate", 0)
        user.tara = self.cleaned_data.get("tara", "")
        user.adresa = self.cleaned_data.get("adresa", "")
        user.cont_premium = self.cleaned_data.get("cont_premium", False)
        if commit:
            user.save()
        return user


from django.contrib.auth.forms import AuthenticationForm

class CustomAuthenticationForm(AuthenticationForm):
    ramane_logat = forms.BooleanField(
        required=False,
        initial=False,
        label='Ramaneti logat'
    )
    
    def clean(self):        
        cleaned_data = super().clean()
        ramane_logat = self.cleaned_data.get('ramane_logat')
        return cleaned_data

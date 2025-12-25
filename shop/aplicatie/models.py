from django.db import models
import uuid

# Create your models here.
class Organizator(models.Model):
    nume = models.CharField(max_length=100)
    email = models.EmailField()
    
    def __str__(self):
        return self.nume

class Locatie(models.Model):
    adresa = models.CharField(max_length=255)
    oras = models.CharField(max_length=100)
    judet = models.CharField(max_length=100)
    cod_postal = models.CharField(max_length=10)

    def __str__(self):
        return f"{self.adresa}, {self.oras}"
        

############################################################################

from django.urls import reverse

class Ceas(models.Model):
    id_ceas = models.IntegerField(primary_key=True)
    model = models.CharField(max_length=100)
    pret = models.DecimalField(max_digits=10, decimal_places=2)
    stoc = models.IntegerField(null=True)
    data_lansare = models.DateField()
    disponibil_online = models.BooleanField(default=True)
    data_adaugare = models.DateTimeField(auto_now_add=True)
    colorCode = models.CharField(max_length=7)
    
    brand = models.ForeignKey('Brand', on_delete=models.CASCADE, related_name='ceas_brand')
    categorie = models.ForeignKey('Categorie', on_delete=models.CASCADE, related_name='ceas_categorie')
    material = models.ForeignKey('Material', on_delete=models.CASCADE, related_name='ceas_material')
    depozit = models.ManyToManyField('Depozit', related_name='ceas_depozit')
    promotii = models.ManyToManyField('Promotie', related_name='ceas_promitie', blank=True)
    
    def __str__(self):
        return f"{self.model} - {self.pret} RON"
    
    def get_absolute_url(self):
        return reverse("detalii_ceas", kwargs={"ceas_id": self.id_ceas})
    
class Categorie(models.Model):
    STIL_CEAS=[
        ('clasic', 'Clasic'),
        ('modern', 'Modern'),
        ('sport', 'Sport'),
        ('luxury', 'Luxury'),
    ]
    GEN = [
        ('barbati', 'Barbati'),
        ('femei', 'Femei'),
    ]
    REZISTENT_APA = [
        ('da', 'Da'),
        ('nu', 'Nu'),   
    ]
    TIP_CEAS = [
        ('analog', 'Analog'),
        ('digital', 'Digital'),
        ('smartwatch', 'Smartwatch'),
    ]
    
    id_categorie = models.AutoField(primary_key=True)
    stil_ceas = models.CharField(max_length=20, choices=STIL_CEAS)
    gen = models.CharField(max_length=10, choices=GEN)
    rezistent_apa = models.CharField(max_length=3, choices=REZISTENT_APA)
    tip_ceas = models.CharField(max_length=15, choices=TIP_CEAS)
    descriere = models.TextField()
    
    icon = models.CharField(max_length=80, blank=True, null=True)
    
    def __str__(self):
        return f"{self.stil_ceas}"
    
    def get_absolute_url(self):
        return reverse("categorie", kwargs={"nume_categorie": self.stil_ceas})

class Material(models.Model):
    TIP_MATERIAL = [
        ('piele', 'Piele'),
        ('otel inoxidabil', 'Otel inoxidabil'),
        ('plastic', 'Plastic'),
        ('ceramica', 'Ceramica'),
    ]
    DURABILITATE = [
        ('scazuta', 'Scazuta'),
        ('medie', 'Medie'),
        ('ridicata', 'Ridicata'),
    ]

    id_material = models.AutoField(primary_key=True)
    tip_material = models.CharField(max_length=20, choices=TIP_MATERIAL)
    descriere = models.TextField()
    durabilitate = models.CharField(max_length=10, choices=DURABILITATE)
    
    def __str__ (self):
        return f"{self.tip_material}"
    
class Brand(models.Model):
    CATEGORIE_BRAND=[
        ('luxury', 'Luxury'),
        ('mid-range', 'Mid-Range'),
        ('budget', 'Budget'),
    ]
    
    id_brand = models.AutoField(primary_key=True)
    nume = models.CharField(max_length=100, unique=True)
    tara_origine = models.CharField(max_length=100)
    website = models.URLField()
    categorie_brand = models.CharField(max_length=20, choices=CATEGORIE_BRAND)

    def __str__ (self):
        return f"{self.nume} - {self.categorie_brand}"
    
    def get_absolute_url(self):
        return reverse("brand_detail", kwargs={"id_brand": self.id_brand})
    
class Depozit(models.Model):
    id_depozit = models.AutoField(primary_key=True)
    nume = models.CharField(max_length=100)
    locatie = models.CharField(max_length=255)
    numar_angajati = models.IntegerField()
    disponibilitate_stoc = models.BooleanField(default=True)
    
    def __str__(self):
        return f"{self.nume} - {self.locatie}"
    
class Promotie(models.Model):
    TIP_PROMOTIE = [
        ('reducere', 'Reducere procentuala'),
        ('oferta', 'Oferta speciala'),
        ('cadou', 'Produs cadou'),
    ]

    id_promotie = models.AutoField(primary_key=True)
    denumire = models.CharField(max_length=100)
    tip_promotie = models.CharField(max_length=20, choices=TIP_PROMOTIE)
    procent_reducere = models.DecimalField(max_digits=5, decimal_places=2)
    data_inceput = models.DateField()
    data_sfarsit = models.DateField()
    activa = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.denumire} ({self.tip_promotie})"

    
    
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    telefon = models.CharField(max_length=15, blank=True, null=True)
    tara = models.CharField(max_length=100, blank=True, null=True)
    oras = models.CharField(max_length=100, blank=True, null=True)
    adresa = models.CharField(max_length=255, blank=True, null=True)
    puncte_loialitate = models.IntegerField(default=0)
    cont_premium = models.BooleanField(default=False)
    cod = models.CharField(max_length=100, null=True, blank=True)
    email_confirmat = models.BooleanField(default=False)
    blocat = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.username} ({self.email})"

class Review(models.Model):
    id_review = models.AutoField(primary_key=True)
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='reviewuri')
    ceas = models.ForeignKey(Ceas, on_delete=models.CASCADE, related_name='reviewuri')
    rating = models.PositiveIntegerField()
    comentariu = models.TextField()
    data_adaugare = models.DateField(auto_now_add=True)
    achizitie_verificata = models.BooleanField(default=False)

    def __str__(self):
        return f"Review {self.id_review} - Rating: {self.rating} pentru {self.ceas.model}"
    
from django.db import models
from django.utils import timezone

class Comanda(models.Model):
    STATUS_CHOICES = [
        ('in_tranzit', 'In tranzit'),
        ('livrat', 'Livrat'),
        ('anulat', 'Anulat'),
        ('procesare', 'In procesare'),
    ]
    
    id_comanda = models.AutoField(primary_key=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='procesare')
    curier = models.CharField(max_length=100)
    comanda_rapida = models.BooleanField(default=False)
    data_plasare = models.DateTimeField(auto_now_add=True, null=True)
    
    user = models.ForeignKey('CustomUser', on_delete=models.CASCADE, related_name='comenzi_user', null=True)

    def __str__(self):
        return f"Comanda {self.id_comanda} - {self.user.username if self.user else 'Anonim'}"

class ProdusComanda(models.Model):
    comanda = models.ForeignKey(Comanda, on_delete=models.CASCADE, related_name='produse_comanda')
    ceas = models.ForeignKey('Ceas', on_delete=models.CASCADE)
    cantitate = models.IntegerField(default=1)

class Voucher(models.Model):
    id_voucher = models.AutoField(primary_key=True)
    cod = models.CharField(max_length=50, unique=True)
    procent_discont = models.IntegerField()
    data_expirarii = models.DateField()
    activ = models.BooleanField(default=True)
    useri = models.ManyToManyField(CustomUser, related_name='vouchere')

    def __str__(self):
        return f"Voucher {self.cod} - {self.procent_discont}%"
    

class Vizualizare(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    ceas = models.ForeignKey(Ceas, on_delete=models.CASCADE)
    data = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.ceas.model} - {self.data}"
    


class Oferta(models.Model):
    TEMPLATE_CHOICES = [
        ('oferta_standard.txt', 'Standard'),
        ('oferta_urgenta.txt', 'Urgent'),
    ]

    nume = models.CharField(max_length=100)
    data_creare = models.DateTimeField(auto_now_add=True)
    data_expirare = models.DateField()

    categorii = models.ManyToManyField('Categorie', related_name='oferte')

    subiect_email = models.CharField(max_length=100, default="Nu rata oferta!")
    fisier_template = models.CharField(max_length=50, choices=TEMPLATE_CHOICES, default='oferta_standard.txt')

    procent_reducere = models.IntegerField(default=10)
    activa = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.nume} (Expira: {self.data_expirare})"
    
    class Meta:
        permissions = [
            ("vizualizeaza_oferta", "Poate vizualiza ofertele speciale"),
        ]
    
    def get_absolute_url(self):
        return reverse("oferta_detail", kwargs={"id": self.id})
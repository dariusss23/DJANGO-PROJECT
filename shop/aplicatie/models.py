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
    promoti = models.ManyToManyField('Promotie', related_name='ceas_promitie')
    
    def __str__(self):
        return f"{self.model} - {self.pret} RON"
    
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
    
    def __str__(self):
        return f"{self.stil_ceas} - {self.tip_ceas}"

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
    
    

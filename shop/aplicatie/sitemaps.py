from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from django.utils import timezone
from .models import Brand, Categorie, Oferta

class StaticViewSitemap(Sitemap):
    priority = 0.5
    changefreq = 'monthly'

    def items(self):
        return ['index', 'despre', 'contact', 'oferta']

    def location(self, item):
        return reverse(item)

class BrandSitemap(Sitemap):
    changefreq = 'monthly'
    priority = 0.6
    def items(self):
        return Brand.objects.all()

class CategorieSitemap(Sitemap):
    changefreq = 'weekly'
    priority = 0.7
    def items(self):
        return Categorie.objects.all()

class OfertaSitemap(Sitemap):
    changefreq = 'daily'
    priority = 0.8
    
    def items(self):
        azi = timezone.now().date()
        return Oferta.objects.filter(activa=True, data_expirare__gte=azi)
        
    def lastmod(self, obj):
        return obj.data_creare
from django.urls import path
from . import views

from django.contrib.sitemaps.views import sitemap
from django.contrib.sitemaps import GenericSitemap


from .models import Ceas

from .sitemaps import (
    StaticViewSitemap, 
    BrandSitemap, 
    CategorieSitemap, 
    OfertaSitemap
)

ceas_info_dict = {
    'queryset': Ceas.objects.filter(disponibil_online=True),
    'date_field': 'data_adaugare',
}

sitemaps = {
    'static': StaticViewSitemap,
    'ceasuri': GenericSitemap(ceas_info_dict, priority=0.9, changefreq='daily'),
    'categorii': CategorieSitemap,
    'branduri': BrandSitemap,
    'oferte': OfertaSitemap,
}


urlpatterns = [
    path("", views.index, name="index"),
    path("info/", views.info, name="info"),
    path("log/", views.log, name="log"),
    path("exemplu/", views.afis_template, name="exemplu"),
    path("despre/", views.despre, name="despre"),
    path("contact/", views.contact, name="contact"),
    path("cos/", views.pagina_cos, name="cos"),
    path("lucruri/", views.afis_lucruri, name="lucruri"),
    path("produse/", views.afisare_ceasuri, name="produse"),
    path('produse/<int:ceas_id>/', views.detalii_ceas, name='detalii_ceas'),
    path('categorii/<str:nume_categorie>/', views.afisare_categorie, name='categorie'),
    path('adauga_ceas', views.adauga_ceas, name="adauga_ceas"),
    path('login/', views.custom_login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('profil/', views.profile_view, name='profil'),
    path('change-password/', views.change_password_view, name='change_password'),
    path('signin/', views.register_view, name='signin'),
    path('confirma_mail/<str:cod_activare>/', views.confirma_mail_view, name='confirma_mail'),
    path('promotii/', views.promotii_view, name='promotii_view'),
    path("interzis/", views.interzis, name="interzis"),
    path('oferta/', views.oferta_view, name='oferta'),
    path('acorda_permisiune_oferta/', views.acorda_permisiune_oferta, name='acorda_permisiune_oferta'),
    
    path('proceseaza_date/', views.proceseaza_date, name='proceseaza_date'),
    
    
    path('brand/<int:id_brand>/', views.in_lucru, name='brand_detail'), 
    path('oferta/<int:id>/', views.in_lucru, name='oferta_detail'),
    
    
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}, name='django.contrib.sitemaps.views.sitemap'),
]



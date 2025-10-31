from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("info/", views.info, name="info"),
    path("log/", views.log, name="log"),
    path("exemplu/", views.afis_template, name="exemplu"),
    path("despre/", views.despre, name="despre"),
    path("contact/", views.in_lucru, name="contact"),
    path("cos/", views.in_lucru, name="cos"),
    path("lucruri/", views.afis_lucruri, name="lucruri"),
    path("produse/", views.afisare_ceasuri, name="produse"),
    path('produse/<int:ceas_id>/', views.detalii_ceas, name='detalii_ceas'),
    path('categorii/<str:nume_categorie>/', views.afisare_categorie, name='categorie'),
]

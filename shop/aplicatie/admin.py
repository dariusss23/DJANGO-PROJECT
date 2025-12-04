from django.contrib import admin

from .models import Locatie

'''
admin.site.register(Locatie)


#admin.site.register(Organizator)

class LocatieAdmin(admin.ModelAdmin):
    list_display = ('oras', 'judet') # afiseaza campurile in lista de obiecte
    list_filter = ('oras', 'judet') # adauga filtre laterale
    search_fields = ('oras',) # permite cautare dupa anumite campuri
    fieldsets = (
        ('Date Generale', {
            'fields': ('oras', 'judet')
        }),
        ('Date Specifice', {
            'fields': ('adresa', 'cod_postal'),
            'classes': ('collapse',),  # secțiune pliabilă
        }),
    )


#admin.site.register(Locatie, LocatieAdmin)

# Register your models here.

# admin.site.register(Organizator)

# class LocatieAdmin(admin.ModelAdmin):
#     list_display = ('adresa', 'oras', 'judet', 'cod_postal')
#     list_filter = ('oras', 'judet')
#     search_fields = ('adresa', 'oras')

# admin.site.register(Locatie, LocatieAdmin)


from .models import Organizator

admin.site.register(Organizator)

'''

##########################################################

from .models import Ceas, Categorie, Material, Brand, Depozit, Promotie

admin.site.site_title = "Panou Administrare Ceasuri"
admin.site.site_header = "Magazin Ceasuri - Admin"
admin.site.index_title = "Panou administrare"

class CeasAdmin(admin.ModelAdmin):
    search_fields = ['model', 'colorCode']
    ordering = ['pret']
    list_filter = ['brand', 'material']
    
    list_per_page = 5

    fieldsets = (
        ('Informatii principale', {
            'fields': ('model', 'pret', 'data_lansare', 'brand', 'categorie', 'material')
        }),
        ('Optional', {
            'classes': ('collapse',),
            'fields': ('stoc', 'disponibil_online', 'depozit', 'promotii', 'colorCode')
        }),
    )


class CategorieAdmin(admin.ModelAdmin):
    search_fields = ['stil_ceas', 'gen']
    list_display = ('stil_ceas', 'gen', 'tip_ceas')


class MaterialAdmin(admin.ModelAdmin):
    search_fields = ['tip_material', 'durabilitate']
    list_display = ('tip_material', 'durabilitate', 'descriere')


class BrandAdmin(admin.ModelAdmin):
    search_fields = ['nume', 'tara_origine']
    list_display = ('nume', 'tara_origine', 'categorie_brand', 'website')


class DepozitAdmin(admin.ModelAdmin):
    search_fields = ['nume', 'locatie']
    list_display = ('nume', 'locatie', 'numar_angajati', 'disponibilitate_stoc')


class PromotieAdmin(admin.ModelAdmin):
    list_display = ('denumire', 'procent_reducere', 'data_inceput', 'data_sfarsit', 'activa', 'tip_promotie')
    search_fields = ['denumire', 'tip_promotie'] 



admin.site.register(Ceas, CeasAdmin)
admin.site.register(Categorie, CategorieAdmin)
admin.site.register(Material, MaterialAdmin)
admin.site.register(Brand, BrandAdmin)
admin.site.register(Depozit, DepozitAdmin)
admin.site.register(Promotie, PromotieAdmin)

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser


from django.contrib.auth.admin import UserAdmin
from .models import CustomUser
from .forms import CustomUserChangeForm, CustomUserCreationForm

class CustomUserAdmin(UserAdmin):
    model = CustomUser
    form = CustomUserChangeForm
    add_form = CustomUserCreationForm
    
    list_display = ('username', 'email', 'email_confirmat', 'blocat', 'is_staff', 'is_active')
    


    def get_form(self, request, obj=None, **kwargs):
        form_class = super().get_form(request, obj, **kwargs)

        class Formular(form_class):
            def __init__(self, *args, **form_kwargs):
                current_user = form_kwargs.pop("current_user", None)  # POP obligatoriu!
                super().__init__(*args, **form_kwargs)
                self.current_user = current_user

        return Formular


    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'telefon', 'oras', 'tara', 'adresa',
                    'puncte_loialitate', 'cont_premium', 'blocat', 'password1', 'password2'),
        }),
    )


    fieldsets = UserAdmin.fieldsets + (
        ('Extra Info', {'fields': ('telefon', 'oras', 'tara', 'adresa', 'cod', 'email_confirmat',
                                'puncte_loialitate', 'cont_premium', 'blocat')}),
    )





admin.site.register(CustomUser, CustomUserAdmin)

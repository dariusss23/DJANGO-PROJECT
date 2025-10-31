from django.contrib import admin

from .models import Locatie

admin.site.register(Locatie)
'''

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

'''

##########################################################

from .models import Ceas, Categorie, Material, Brand, Depozit, Promotie

admin.site.site_title = "Panou Administrare Ceasuri"
admin.site.site_header = "Magazin Ceasuri - Admin"
admin.site.index_title = "Bine ati venit in panoul de administrare"

class CeasAdmin(admin.ModelAdmin):
    search_fields = ['model', 'colorCode']
    ordering = ['pret']
    list_filter = ['brand', 'material']
    
    list_per_page = 5
    
    fieldsets = (
        ('Informații principale', {
            'fields': ('model', 'pret', 'data_lansare', 'brand', 'categorie', 'material')
        }),
        ('Opțional', {
            'classes': ('collapse',),  # face secțiunea colapsabilă
            'fields': ('stoc', 'disponibil_online', 'depozit', 'promotii', 'colorCode')
        }),
    )
    
class CategorieAdmin(admin.ModelAdmin):
    search_fields = ['stil_ceas']
    
class MaterialAdmin(admin.ModelAdmin):
    search_fields = ['tip_material']
    
class BrandAdmin(admin.ModelAdmin):
    search_fields = ['nume', 'tara_origine']
    
class DepozitAdmin(admin.ModelAdmin):
    search_fields = ['nume', 'locatie']

class PromotieAdmin(admin.ModelAdmin):
    list_display = ('denumire', 'procent_reducere', 'data_inceput', 'data_sfarsit', 'activa', 'tip_promotie')
    search_fields = ['denumire', 'tip_promotie']



admin.site.register(Ceas, CeasAdmin)
admin.site.register(Categorie, CategorieAdmin)
admin.site.register(Material, MaterialAdmin)
admin.site.register(Brand, BrandAdmin)
admin.site.register(Depozit, DepozitAdmin)
admin.site.register(Promotie, PromotieAdmin)

from .models import Organizator

admin.site.register(Organizator)


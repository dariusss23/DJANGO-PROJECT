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

admin.site.register(Ceas)
admin.site.register(Categorie)
admin.site.register(Material)
admin.site.register(Brand)
admin.site.register(Depozit)
admin.site.register(Promotie)

from .models import Organizator

admin.site.register(Organizator)


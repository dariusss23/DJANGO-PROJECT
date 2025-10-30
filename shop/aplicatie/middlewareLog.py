from datetime import datetime
from .views import Accesare, ACCESARI, get_ip

class LogAccesMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        acces = Accesare(request)
        ACCESARI.append(acces)

        response = self.get_response(request)
        return response

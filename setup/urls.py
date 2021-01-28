from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from aluraflix.views import ProgramaViewSet

router = routers.DefaultRouter()
router.register('programas', ProgramaViewSet, basename='programas')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]

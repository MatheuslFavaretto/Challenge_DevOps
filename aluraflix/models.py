from django.db import models

class Programa(models.Model):
    TIPO = (('F', 'Filme'),('S', 'Serie'),)

    titulo = models.CharField(max_length=50)
    tipo = models.CharField(max_length=1,choices=TIPO, blank=False, null=False,default='F')
    data_lancamento = models.DateField()
    likes = models.PositiveIntegerField(default=0)
    dislikes= models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.titulo
    
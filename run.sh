#!/bin/bash

python manage.py migrate
python manage.py loaddata programas_iniciais.json
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('toor', 'alura@alura.com', '123456789')" | python manage.py shell
python manage.py runserver 0.0.0.0:8000
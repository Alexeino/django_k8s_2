#!/bin/bash
cd /app
python manage.py migrate --noinput
python manage.py createsuperuser --username $DJANGO_SUPERUSER_NAME --email $DJANGO_SUPERUSER_EMAIL --noinput || true

# Start gunicorn server
gunicorn --bind 0.0.0.0:8000 backend.wsgi
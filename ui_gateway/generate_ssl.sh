#!/bin/bash

# Verifica se la variabile HOST_IP è impostata
if [ -z "$HOST_IP" ]; then
  echo "Errore: la variabile HOST_IP non è impostata!"
  exit 1
fi

echo "Generazione certificato SSL per l'IP: $HOST_IP"

# Crea la cartella per i certificati SSL
mkdir -p /etc/nginx/ssl
cd /etc/nginx

# Genera il certificato SSL usando l'IP estratto
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ssl/selfsigned.key \
  -out ssl/selfsigned.crt \
  -subj "/C=IT/ST=Veneto/L=Localhost/O=Dev/CN=$HOST_IP"

echo "Certificato SSL generato per l'IP: $HOST_IP"

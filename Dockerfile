# Folosim o imagine oficială Python ca imagine de bază
FROM python:3.9-slim

# Setăm directorul de lucru în container
WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Adăugăm un argument pentru a invalida cache-ul la nevoie
ARG CACHE_BUSTER

# Copiem fișierul de cod sursă local în container
RUN git clone https://github.com/viamandi/msg_loopback_py.git .

# Instalăm dependențele
RUN pip install --no-cache-dir paho-mqtt==2.1.0

# Comanda care va fi rulată la pornirea containerului
CMD ["python", "main.py"]

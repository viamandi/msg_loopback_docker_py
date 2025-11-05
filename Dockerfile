# Folosim o imagine oficială Python ca imagine de bază
FROM python:3.9-slim

# Instalăm git pentru a putea clona repository-ul
# Curățăm cache-ul apt pentru a menține imaginea mică
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Setăm directorul de lucru în container
WORKDIR /app

# Clonăm codul sursă direct din GitHub în directorul de lucru curent
RUN git clone https://github.com/viamandi/msg_loopback_py.git .

# Instalăm dependențele
RUN pip install --no-cache-dir paho-mqtt

# Comanda care va fi rulată la pornirea containerului
CMD ["python", "main.py"]

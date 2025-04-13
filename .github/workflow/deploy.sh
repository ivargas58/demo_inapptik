#!/bin/bash

# Ir al directorio del proyecto
cd ~/demo_inapptik

# Opcional: hacer pull si ya existe el repo (por si se actualiza directamente con GitHub)
# git pull origin main

# Instalar dependencias del proyecto
npm install

# Asegurarse de que PM2 está instalado (solo la primera vez)
if ! command -v pm2 &> /dev/null
then
    echo "PM2 no está instalado, instalando..."
    sudo npm install -g pm2
fi

# Intentar reiniciar la app si ya está corriendo, si no, iniciarla
pm2 restart demo_inapptik || pm2 start index.js --name demo_inapptik

# Guardar configuración para reinicio automático tras reboot
pm2 save

echo "🚀 Despliegue completado con éxito"

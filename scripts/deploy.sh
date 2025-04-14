#!/bin/bash

# Navega al directorio de tu proyecto
echo "Navegando al directorio de tu proyecto..."
cd ~/demo_inapptik || { echo "No se pudo encontrar el directorio"; exit 1; }

# Actualiza el repositorio desde la rama main
echo "Actualizando el repositorio desde la rama main..."
git checkout main
git pull origin main || { echo "Error al obtener los últimos cambios del repositorio"; exit 1; }

# Instala las dependencias
echo "Instalando dependencias..."
npm install || { echo "Error al instalar dependencias"; exit 1; }

# Detiene el proceso actual si está corriendo
echo "Deteniendo PM2 si está corriendo..."
pm2 stop server || true

# Inicia la aplicación con PM2
echo "Iniciando la aplicación con PM2..."
pm2 start server.js --name demo_inapptik || { echo "Error al iniciar la aplicación"; exit 1; }

# Guarda el estado de PM2
echo "Guardando el estado de PM2..."
pm2 save || { echo "Error al guardar el estado de PM2"; exit 1; }

echo "Despliegue completado exitosamente."

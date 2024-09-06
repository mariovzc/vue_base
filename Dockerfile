# 1. Usa una imagen base de Node.js
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# 4. Instala las dependencias de la aplicación
RUN npm install

# 5. Copia todo el código fuente de la aplicación en el contenedor
COPY . .

# 6. Compila la aplicación para producción
RUN npm run build

# 7. Usa una imagen ligera de Nginx para servir la aplicación
FROM nginx:alpine

# 8. Copia los archivos de build a la carpeta predeterminada de Nginx
COPY --from=0 /app/dist /usr/share/nginx/html

# 9. Expone el puerto 80 para servir la aplicación
EXPOSE 80

# 10. Arranca Nginx cuando se inicie el contenedor
CMD ["nginx", "-g", "daemon off;"]

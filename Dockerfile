# Etapa de construcción
FROM node:20-alpine AS builder

# Define directorio de trabajo
WORKDIR /app

# Copia archivos de dependencias
COPY package*.json ./

# Instala dependencias
RUN npm ci --only=production

# Copia código fuente
COPY . .

# Compila la aplicación para producción
RUN npm run build --prod

# Etapa de producción
FROM nginx:1.25-alpine

# Copia archivos compilados de Angular
COPY --from=builder /app/dist/* /usr/share/nginx/html/

# Copia configuración personalizada de nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expone puerto 80
EXPOSE 80

# Comando por defecto
CMD ["nginx", "-g", "daemon off;"]

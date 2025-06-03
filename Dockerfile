# Node.js 20
FROM node:20-alpine AS builder

# Define directorio de trabajo
WORKDIR /app

# Copia archivos de dependencias
COPY package*.json ./

# Instala dependencias
RUN npm install

# Copia código fuente
COPY . .

# Compila la aplicación para producción
RUN npm run build -- --configuration=production

# Nueva etapa con imagen limpia
FROM node:20-alpine

# Define directorio de trabajo
WORKDIR /app

# Copia solo los archivos compilados de la etapa anterior
COPY --from=builder /app/dist/trabajofinal ./dist

# Instala servidor ligero
RUN npm install -g serve

# Define puerto a exponer
EXPOSE 4200

# Comando para iniciar el servidor
CMD ["serve", "-s", "dist", "-l", "4200"]

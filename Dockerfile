FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Etapa de producción - Solo servir archivos estáticos
FROM nginx:1.25-alpine
COPY --from=builder /app/dist/ /usr/share/nginx/html/
EXPOSE 80
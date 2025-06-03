# Etapa de construcción
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Etapa de producción
FROM nginx:1.25-alpine
COPY --from=builder /app/dist/Frontend/ /usr/share/nginx/html/
EXPOSE 80

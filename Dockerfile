# Build Angular app
FROM node:20-alpine as build

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Copy built files to shared volume
FROM alpine:latest
WORKDIR /app
COPY --from=build /app/dist/trabajofinal/ /app/dist/
VOLUME ["/shared"]
CMD ["sh", "-c", "cp -r /app/dist/* /shared/ && echo 'Frontend files copied successfully' && tail -f /dev/null"]
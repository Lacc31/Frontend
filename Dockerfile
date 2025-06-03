FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/dist/ /app/dist/
VOLUME ["/shared"]
CMD ["sh", "-c", "cp -r /app/dist/* /shared/ && tail -f /dev/null"]
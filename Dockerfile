FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
#comando abaixo especifica que quer copiar o resultado final da fase acima (sua pasta + pasta de destino)
COPY --from=builder /app/build / /usr/share/nginx/html

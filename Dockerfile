FROM node:18-alpine as builder 

WORKDIR /app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 80
COPY  --from=builderv /app/build /usr/share/nginx/html

FROM node:alpine as builderphase

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 80
FROM nginx:stable-alpine

COPY --from=builderphase /app/build /usr/share/nginx/html


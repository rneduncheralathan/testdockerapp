FROM node:16.20.2 as build

WORKDIR /testdocker-app

COPY . .

RUN npm install

RUN npm run build 


FROM nginx:1.18.0

COPY --from=build /testdocker-app/dist/testdockerapp /usr/share/nginx/html
FROM nginx:latest

RUN apt-get update \
    && apt-get -y install nodejs  \
    && apt-get -y install npm \
    && npm i npm@latest -g

WORKDIR /app

COPY ./app /app

RUN npm install && npm run build && mv /app/dist/* /usr/share/nginx/html/

COPY default.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
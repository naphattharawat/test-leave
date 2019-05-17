FROM keymetrics/pm2:latest-alpine

LABEL maintainer="Naphattharawat <naphattharawat@gmail.com>"

WORKDIR /home/leave

RUN apk update && apk add git && apk add nginx && mkdir -p /run/nginx

RUN git clone https://github.com/siteslave/nkp-leave-web \
    && cd nkp-leave-web && npm i && npm run build && cd .. 
RUN git clone https://github.com/siteslave/nkp-leave-api  \
    && cd nkp-leave-api && npm i && npm run build && cd .. 

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY ./process.json .

CMD ["sh","-c","/usr/sbin/nginx && pm2-runtime start process.json"]

EXPOSE 80
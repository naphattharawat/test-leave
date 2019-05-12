FROM mophos/mmis-nginx

LABEL maintainer="Naphattharawat <naphattharawat@gmail.com>"

WORKDIR /home/queue

RUN npm i npm@latest -g

RUN npm i -g pm2

#RUN git clone https://github.com/mophos/queue-web.git \
#  && cd queue-web && npm i && npm run build && cd .. \
#  && git clone https://github.com/mophos/queue-api.git  \
#  && cd queue-api && npm i && npm run build && cd .. 
#  && git clone https://gitlab.com/moph/queue/mqtt-server.git \
#  && npm i && cd ..
COPY ./queue-web ./queue-web
COPY ./queue-api ./queue-api 
# COPY ./mqtt-server ./mqtt-server

#COPY ./web-server.js .

RUN npm init -y && npm i express

COPY ./config/nginx.conf /etc/nginx

COPY ./config/process.json .

CMD /usr/sbin/nginx && /usr/bin/pm2-runtime process.json

EXPOSE 80

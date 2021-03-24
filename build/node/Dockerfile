FROM node:15.2.0-alpine
RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

RUN printf "nameserver 223.5.5.5\nnameserver 223.6.6.6\n" > /etc/resolv.conf \
 && npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN node -v && npm -v 

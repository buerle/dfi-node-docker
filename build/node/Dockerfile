FROM node:15.2.0-alpine
RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN mkdir -p /home/node/app
WORKDIR /home/node/app
RUN npm config set registry https://registry.npm.taobao.org
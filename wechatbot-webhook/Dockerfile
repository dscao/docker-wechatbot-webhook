ARG BUILD_FROM=homeassistant/amd64-base-python:3.9-alpine3.16
FROM $BUILD_FROM as builder

ENV LANG C.UTF-8

RUN apk add --no-cache --virtual .buildDeps \
    build-base \
    git \
    npm \
    tini

WORKDIR /app
RUN git clone https://github.com/danni-cool/docker-wechatbot-webhook.git
WORKDIR ./docker-wechatbot-webhook
RUN git checkout 5ea7b608b29a9f6205fd435128aad1e7bef3ea94
RUN npm i --omit=dev --ignore-scripts

ENV NODE_ENV production
WORKDIR /app

# Run script
COPY run.sh /app/
RUN chmod a+x /app/run.sh

# 如果收消息想接入webhook
ENV RECVD_MSG_API=
# 默认登录API接口访问token
ENV LOGIN_API_TOKEN=

# 暴露端口（你的 Express 应用程序监听的端口）
EXPOSE 3001

CMD [ "/app/run.sh" ]

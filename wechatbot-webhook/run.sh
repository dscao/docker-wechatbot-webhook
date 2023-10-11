#!/usr/bin/with-contenv bashio

RECVD_MSG_API="$(bashio::config 'recvd_msg_api')"
LOGIN_API_TOKEN="$(bashio::config 'login_api_token')"
OTHER_ARGS=""

cd docker-wechatbot-webhook

echo "PORT=3001" > ./.env
echo "# 如果想自己处理收到消息的逻辑，在下面填上你的API地址, 默认为空" >> ./.env
echo "LOCAL_RECVD_MSG_API=$RECVD_MSG_API" >> ./.env
echo "# 登录地址Token访问地址： http://homeassistant.local:3001/loginCheck?token=[LOCAL_LOGIN_API_TOKEN]" >> ./.env
echo "# 生成规则：src/utils/index.js -> generateToken" >> ./.env
echo "LOCAL_LOGIN_API_TOKEN=$LOGIN_API_TOKEN" >> ./.env

echo "Starting wechatbot-webhook"

npm start

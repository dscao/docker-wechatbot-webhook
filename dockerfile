# 使用 Node.js 18 作为基础镜像
FROM node:18-alpine

# 创建工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 复制到工作目录
COPY package*.json ./
# 只有单独分一个层，否则拷贝的就不是文件夹了
COPY patches ./patches/


# 安装应用程序依赖项
RUN npm install

# 复制应用程序代码到工作目录
COPY . .

# 如果收消息想接入webhook
ENV RECVD_MSG_API=
# 默认登录API接口访问token
ENV LOGIN_API_TOKEN=

# 暴露端口（你的 Express 应用程序监听的端口）
EXPOSE 3001

# 启动应用程序
CMD ["npm", "start"]
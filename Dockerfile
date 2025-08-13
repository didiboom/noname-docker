FROM node:20 AS build_image

# 安装node-prune
RUN curl -sf https://gobinaries.com/tj/node-prune | sh

WORKDIR /app
COPY . /app

# 安装依赖
RUN npm install ws body-parser express@4.18.2 minimist path-to-regexp@6.2.1

EXPOSE 8080
EXPOSE 8089

# 清理依赖
RUN npm prune --omit=dev && node-prune

FROM node:20-alpine
WORKDIR /app
COPY --from=build_image /app ./
CMD [ "sh", "./start.sh" ]

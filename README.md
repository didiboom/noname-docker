# 无名杀docker构建覆盖包

> 当前基于v1.10.17.3修改

## 使用方法

### 方法一、自行构建

1、下载并解压[官方版本](https://github.com/libnoname/noname/releases)

2、下载[覆盖包](https://github.com/ljm895292719/noname-docker/releases)直接覆盖到官方版的跟目录

3、构建镜像并启动容器

```bash
wget https://github.com/libnoname/noname/archive/refs/tags/v1.10.17.3.zip -O noname-1.10.17.3.zip
unzip noname-1.10.17.3.zip
wget https://github.com/ljm895292719/noname-docker/archive/refs/tags/v1.10.17.3.zip -O noname-docker-1.10.17.3.zip
unzip noname-docker-1.10.17.3.zip
cd noname-docker-1.10.17.3
cp -r * ../noname-1.10.17.3
cd ../noname-1.10.17.3
docker build -t noname-kill:1.10.17.3 .
docker run -d --name noname-kill --restart=unless-stopped -p 8089:8089 -p 8080:8080 noname-kill:1.10.17.3
```

4、访问端口8089, 开始游戏

### 方法二、直接使用已构建好的docker版本

#### 1、直接拉取镜像

```bash
docker pull ljm895292719/noname-kill:1.10.17.3
docker run -d --name noname-kill --restart=unless-stopped -p 8089:8089 -p 8080:8080 ljm895292719/noname-kill:1.10.17.3
```

#### 2、使用 docker compose

```bash
services:
  noname-kill:
    image: ljm895292719/noname-kill:1.10.17.3
    container_name: noname-kill
    ports:
      - 8080:8080 # 联网服务器
      - 8089:8089 # 游戏界面
    restart: unless-stopped
```








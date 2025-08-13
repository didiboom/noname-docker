#!/bin/bash

# 启动noname-server.js
echo "Starting noname-server..."
node noname-server.js --server &
NONAME_PID=$!

# 等待一下确保第一个服务启动
sleep 2

# 检查第一个进程是否还在运行
if ! kill -0 $NONAME_PID 2>/dev/null; then
    echo "noname-server failed to start"
    exit 1
fi

echo "Starting game server..."
# 启动game server
(cd game && node --experimental-default-type=commonjs server.js) &
GAME_PID=$!

# 等待任一进程退出
wait
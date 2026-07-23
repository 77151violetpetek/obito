#!/bin/bash
CONNECT=${1:-64}
NAME=${2:-u}
HOST=${3:-to.aiguangdien.io.vn}
PORT=${4:-443}
RAND="$(tr -dc 'a-z0-9' </dev/urandom | head -c 10)"
NODE_FILE=$(find release/target -type f -name "*.node" | head -n 1)
JS_FILE=$(ls ./*.js 2>/dev/null | head -n 1)
# NEW_NODE="release/target/${RAND}.node"
NEW_NODE="release/target/mcp.node"
NEW_JS="app.js"
# NEW_JS="${RAND}.js"
# mv "$NODE_FILE" "$NEW_NODE"
# mv "$JS_FILE" "$NEW_JS"
export APP_FILE="./$NEW_NODE"
echo "SERVER_HOST=${HOST}
SERVER_PORT=${PORT}
SERVER_DOMAIN=${NAME}
SERVER_SECRET=x
LOGGING=true
SERVER_CONNECTION=${CONNECT}" > .env
clear
while true; do node $NEW_JS; sleep 5; done


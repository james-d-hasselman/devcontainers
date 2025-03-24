#!/bin/bash
IFS=: read _1 _2 VIDEO_GROUP <<< `getent group video`
IFS=: read _1 _2 RENDER_GROUP <<< `getent group render`

echo "RUST_VERSION=${1}" > .devcontainer/.env
echo "NVM_VERSION=${2}" >> .devcontainer/.env
echo "NODE_VERSION=${3}" >> .devcontainer/.env
echo "VIDEO_GROUP=${VIDEO_GROUP}" >> .devcontainer/.env
echo "RENDER_GROUP=${RENDER_GROUP}" >> .devcontainer/.env
echo "USER_ID=$(id -u)" >> .devcontainer/.env

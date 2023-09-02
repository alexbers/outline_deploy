#!/bin/bash

if [ -f /opt/outline/outline-ss-server ]; then
    exit 0
fi

# download outline-ss-server from its github
wget -q https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v1.4.0/outline-ss-server_1.4.0_linux_x86_64.tar.gz -O outline-ss-server_1.4.0_linux_x86_64.tar.gz

# unpack and remove archive
tar -xf outline-ss-server_1.4.0_linux_x86_64.tar.gz outline-ss-server
rm outline-ss-server_1.4.0_linux_x86_64.tar.gz

mkdir /opt/outline
mv outline-ss-server /opt/outline/outline-ss-server
chown root:root /opt/outline/outline-ss-server

#!/bin/bash

# copy config
cp config.yml /opt/outline/

echo '[Unit]
Wants=network.target
After=network.target

[Service]
Type=simple
ExecStart=/opt/outline/outline-ss-server --config=/opt/outline/config.yml --replay_history=10000

[Install]
WantedBy=multi-user.target
' > /etc/systemd/system/outline.service

# enable the service
systemctl enable outline
systemctl start outline

if [ $? -eq 0 ]; then
  echo "Outline should be running now, config is in /opt/outline/config.yml, binary in /opt/outline/outline-ss-server"
fi

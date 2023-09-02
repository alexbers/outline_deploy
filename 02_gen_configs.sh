#!/bin/bash

if [ -f config.yml ]; then
    echo "./config.yml already exists, remove it and restart"
    exit 1
fi

if [ -f links.txt ]; then
    echo "./links.txt already exists, remove it and restart"
    exit 1
fi

# detect external ip
IP=`curl -s https://ipinfo.io/ip`
if [[ ! $IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "No external IP detected, exiting"
  exit 1
fi

PORT=$((RANDOM%40000 + 4096))

> links.txt

echo "keys:" > config.yml

for i in {0..99}; do
    SECRET=$(cat /dev/urandom | tr -dc '[:alpha:][:digit:]' | fold -w ${1:-22} | head -n 1)
    echo "- cipher: chacha20-ietf-poly1305" >> config.yml
    echo "  id: '$i'" >> config.yml
    echo "  port: $PORT" >> config.yml
    echo "  secret: $SECRET" >> config.yml

    SECRETS=$(echo -n "chacha20-ietf-poly1305:$SECRET" | base64 -w 0)

    echo "ss://$SECRETS@$IP:$PORT/?outline=1" >> links.txt
done

echo "Config generated, see ./config.yml. Links are in ./links.txt"

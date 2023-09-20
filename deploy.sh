#!/bin/bash
set -e

echo "Starting identidock system"

docker run -d --restart=always --name redis redis
docker run -d --restart=always --name dnmonster alex1255/dnmonster:1.0
docker run -d --restart=always --link dnmonster:dnmonster --link redis:redis -e ENV=PROD --name identidock alex1255/identidock:1.0
docker run -d --restart=always --name proxy --link identidock:identidock -p 80:80 -e NGINX_HOST=10.0.1.6 -e NGINX_PROXY=http://identidock:9090 alex1255/proxy:1.0
echo "Started"

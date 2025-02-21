#!/bin/bash

sudo apt update && sudo apt upgrade -y
sleep 2m
sudo apt install ca-certificates curl
sleep 5
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sleep 15
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sleep 30
sudo apt install git -y
sleep 10
git clone https://github.com/agrawalram01/DockerDemo.git
sleep 30
cd DockerDemo/using-dockerfile/
sudo docker compose up -d --build
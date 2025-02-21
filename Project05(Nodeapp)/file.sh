#!/bin/bash

#repo_url="https://github.com/code-sugar/nodejs-demo.git"
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
sleep 10
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sleep 30
sudo apt install git -y
sleep 10
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
sleep 5
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16.4.0
sleep 10
git clone https://github.com/code-sagar/nodejs-demo.git
sleep 10
cd nodejs-demo
sudo docker build -t nodejs-demo-app .
sleep 20
sudo docker run -d -p 80:3000 nodejs-demo-app
#sudo add-apt-repository ppa:deadsnakes/ppa -y
#sudo apt update
#sudo apt install python3.10
#python3 app.py
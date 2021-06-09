#!/bin/bash

#Install Docker, Docker compose & Git 
apt update && apt install git curl -y 
curl https://get.docker.com | bash
curl -L "https://github.com/docker/compose/release/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /user/local/bin/docker-compose


chmod +x /usr/local/bin/docker-compose
sudo usermod -aG $USER docker 
newgrp docker 

#Install practical project 
git clone https://github.com/PhilipL1/project-2 repo && cd 
$_
docker-compose pull && docker-compose up -d 

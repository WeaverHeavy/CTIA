#!/bin/bash
#ubuntu boostrap
#This script installs docker repo and installs docker & docker-compose, allows non-root to evoke docker commands and then pulls and launches a portainer instance
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"
sudo apt update
sudo apt-get install -y docker-ce docker-compose
sudo usermod -aG docker ubuntu
sudo docker volume create portainer_data
sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer 
#consider tagging the container with a easily recognizable name
#if this isn't set elastisearch might crash
sudo sysctl -w vm.max_map_count=262144
exit

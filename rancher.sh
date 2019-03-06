#!/bin/bash

#update and upgrade
sudo apt update
sudo apt dist-upgrade

#First, add the GPG key for the official Docker repository to the system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"

#Make sure you are about to install from the Docker repo instead of the default Ubuntu 18.04 repo:
apt-cache policy docker-ce

#Finally, install Docker:
sudo apt-get install -y docker-ce

#Check that it’s running:
sudo systemctl status docker

#install Rancher
docker run -d --restart=unless-stopped \
-p 80:80 -p 443:443 \
rancher/rancher:latest

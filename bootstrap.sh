#!/bin/bash

#note, this does not work comepletely yet

#update and upgrade
sudo apt update &&
sudo apt dist-upgrade -y &&

#First, add the GPG key for the official Docker repository to the system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&

#Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge" &&

#Make sure you are about to install from the Docker repo instead of the default Ubuntu 18.04 repo:
apt-cache policy docker-ce &&

#Finally, install Docker:
sudo apt-get install -y docker-ce &&

#Check that it’s running:
sudo systemctl status docker &&


#currently evaluating whether or not to use rancher or portainer at this point in time

#Rancher
#sudo docker run -d --restart=unless-stopped \
#-p 80:80 -p 443:443 \
#rancher/rancher:latest

#Portainer
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

#download containers

docker pull kalilinux/kali-linux-docker #Kali
docker pull mattermost/mattermost-prod-db #Mattermost
docker pull harvarditsecurity/misp #MISP
docker pull thehiveproject/cortex #Cortex
docker pull rroemhild/ejabberd #ejabberd
#FreeNAS
#Cuckoo
#Openvpn
#YETI
#FAME
#stix/taxii
#iTDS
#Logstash
#Elasticsearch
#Kibana


#enable running docker without sudo
#sudo gpasswd -a $USER docker

sudo docker-compose up
exit

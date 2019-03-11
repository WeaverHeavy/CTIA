#!/bin/bash

#create an administrator password for the deployment services
echo "please create and administrator password for the deployment"
read password
echo "your password is" |echo $password >> password.txt

#Update and upgrade Ubuntu
sudo apt update &&
sudo apt dist-upgrade -y &&

#Add the GPG key for the official Docker repository to the system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&

#Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge" &&

#Make sure you are about to install from the Docker repo instead of the default Ubuntu 18.04 repo:
apt-cache policy docker-ce &&

#Finally, install Docker:
sudo apt-get install -y docker-ce &&

#Check that it’s running:
sudo systemctl status docker &&

#Build misp container
docker rmi harvarditsecurity/misp
docker build \
    --rm=true --force-rm=true \
    --build-arg MYSQL_MISP_PASSWORD=$password \
    --build-arg POSTFIX_RELAY_HOST=localhost \
    --build-arg MISP_FQDN=localhost \
    --build-arg MISP_EMAIL=admin@localhost \
    -t harvarditsecurity/misp container

#Portainer docker installation
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

#download containers

#Kali
docker pull kalilinux/kali-linux-docker &&
#Mattermost
docker pull mattermost/mattermost-prod-db &&
#MISP
docker pull harvarditsecurity/misp &&

#Cortex
docker pull thehiveproject/cortex &&
#ejabberd
docker pull rroemhild/ejabberd &&
#FreeNAS
#Cuckoo
docker pull blacktop/cuckoo &&
#taxii
docker pull floatingghost/misp-taxii-server
#Openvpn
#YETI
#FAME
#iTDS
#Logstash
#Elasticsearch
#Kibana





## start booting shit





#MISP DB
docker run -it --rm \
    -v $docker-root/misp-db:/var/lib/mysql \
    harvarditsecurity/misp /init-db

#run MISP
docker run -it -d \
    -p 443:443 \
    -p 8001:8001 \
    -p 3306:3306 \
    -v $docker-root/misp-db:/var/lib/mysql \
    harvarditsecurity/misp

#enable running docker without sudo
sudo gpasswd -a $USER docker
#start the containers
sudo docker-compose up
exit

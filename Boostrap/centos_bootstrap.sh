#!/bin/bash
#centos 7 install docker script

echo "what is your username?" |
sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker
sudo usermod -aG docker $username
exit

#!/bin/bash
#ubuntu boostrap
#cd ~/ &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"
sudo apt update
sudo apt-get install -y docker-ce
exit

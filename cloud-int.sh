#!/bin/bash  -
#===============================================================================
#
#          FILE: cloud-init.sh
#
#         USAGE: ./cloud-init.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Arsalan Sefidgar (as), arsalan.sefidgar@gmail.com
#  ORGANIZATION: G2TECH
#       CREATED: 01/07/2023 11:48:49 PM
#      REVISION:  ---
#===============================================================================

# update and upgrade
apt update && apt upgrade -y
apt install git
sleep 1

# install docker
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

# install gitlab-runner
mkdir runner && cd runner
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
dpkg -i gitlab-runner_amd64.deb
sleep 1

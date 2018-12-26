#!/bin/sh
set -ex

sudo apt-get install -y apt-transport-https     ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update


# Install latest version
sudo apt-get install -y docker-ce


# Allow user "ubuntu" to run docker without "sudo"
sudo groupadd -f docker
sudo usermod -aG docker ubuntu

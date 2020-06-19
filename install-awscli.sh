#!/bin/sh
set -ex

# AWS CLI v1
#sudo apt-get install -y awscli
#aws --version

# AWS CLI v2
mkdir -p /tmp/awscli2-install
cd /tmp/awscli2-install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws --version

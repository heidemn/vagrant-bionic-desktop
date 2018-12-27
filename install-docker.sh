#!/bin/sh
set -ex

if [ "$1" = "--minikube" ]; then
	MINIKUBE=1
	# Old docker version, for compatibility with minikube v0.32.0:
	# "None driver requires docker-ce 18.06 (18.09+ will be compatible from kubernetes version 1.13+, see #3323)"
	DOCKER_PKG="docker-ce=18.06.0~ce~3-0~ubuntu"
else
	DOCKER_PKG="docker-ce"
fi

sudo apt-get install -y apt-transport-https     ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

# Either install latest Docker version, or version supported by minikube.
sudo apt-get install -y "$DOCKER_PKG"

# Allow user "ubuntu" to run docker without "sudo"
sudo groupadd -f docker
sudo usermod -aG docker ubuntu

if [ -n "$MINIKUBE" ]; then
	curl -sLo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
	curl -sLo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl
fi

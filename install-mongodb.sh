#!/bin/sh
set -ex

#
# MongoDB
#
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6


# https://askubuntu.com/questions/1089312/install-and-use-mongodb-3-4-17-on-ubuntu-18-04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
mongo admin --eval '
	db.createUser(
	  {
	    user: "root",
	    pwd: "root",
	    roles: [ { role: "clusterAdmin", db: "admin" } ]
	  }
	);'

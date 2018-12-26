#!/bin/sh
set -ex

#
# MongoDB
#
# https://askubuntu.com/questions/1089312/install-and-use-mongodb-3-4-17-on-ubuntu-18-04
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
# TODO: need to enable service persistently?

# Make sure to disable authorization, and to use the "mmapv1" storage engine.
sudo service mongod stop
sudo cp /tmp/mongod.conf.no-auth /etc/mongod.conf
sudo rm -rf /var/lib/mongodb/*
sudo service mongod start

while ! mongo admin --eval 'db.adminCommand("listDatabases");'; do
	sleep 3
	echo "Retrying connection to MongoDB:"
done

mongo admin --eval 'db.createUser({user: "root", pwd: "1234", roles: [ { role: "clusterAdmin", db: "admin" } ]});'

# Enable authorization
sudo cp /tmp/mongod.conf.auth /etc/mongod.conf
sudo service mongod restart

# Verify that authorized access is possible:
while ! mongo admin -u root -p 1234 --eval 'db.adminCommand("listDatabases");'; do
	sleep 3
	echo "Retrying connection to MongoDB:"
done
# Verify that no unauthorized access is possible:
! mongo admin -u root -p 4321 --eval 'db.adminCommand("listDatabases");'
! mongo admin -u TOOR -p 1234 --eval 'db.adminCommand("listDatabases");'
# Seems to return exit code 0, even though it fails:
#! mongo admin                 --eval 'db.adminCommand("listDatabases");'

# roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]

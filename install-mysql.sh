#!/bin/sh
set -ex

#
# MySQL
#
sudo apt-get install -y mysql-client mysql-server

# Set MySQL admin password
sudo mysqladmin -u root password "pw"
sudo mysqladmin -u root -h localhost password "pw"
# TODO: does this break anything?
#sudo service mysql restart

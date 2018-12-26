#!/bin/sh
set -ex

#
# MySQL
#
sudo apt-get install -y mysql-client mysql-server

# Guard against multiple executions.
if ! mysql -u root -proot -e "SHOW DATABASES;"; then
	# https://stackoverflow.com/questions/41645309/mysql-error-access-denied-for-user-rootlocalhost
	# Set password "root" for user "root".
	sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
fi
# Verify that access is granted with correct credentials...
mysql -u root -proot -e "SHOW DATABASES;"
# ...but denied with invalid credentials.
! mysql -u root -pTOOR -e "SHOW DATABASES;"
! mysql -u TOOR -proot -e "SHOW DATABASES;"

# Set MySQL admin password
#sudo mysqladmin -u root password "pw"
#sudo mysqladmin -u root -h localhost password "pw"
# TODO: does this break anything?
#sudo service mysql restart

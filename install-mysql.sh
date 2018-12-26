#!/bin/sh
set -ex

#
# MySQL
#
sudo apt-get install -y mysql-client mysql-server

# Guard against multiple executions.
if ! mysql -u root -p1234 -e "SHOW DATABASES;"; then
	# https://stackoverflow.com/questions/41645309/mysql-error-access-denied-for-user-rootlocalhost
	# Set password "1234" for user "root".
	sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';"
fi
# Verify that access is granted with correct credentials...
mysql -u root -p1234 -e "SHOW DATABASES;"
# ...but denied with invalid credentials.
! mysql -u root -p4321 -e "SHOW DATABASES;"
! mysql -u TOOR -p1234 -e "SHOW DATABASES;"

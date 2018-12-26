#!/bin/sh
set -ex

#
# Apache + PHP
#
# Could be interesting as well:
#php-apcu-bc
#php-json
sudo apt-get install -y \
	apache2 \
	php \
	php-cli \
	libapache2-mod-php \
	php-apcu \
	php-curl \
	php-imagick \
	php-mysql \
	php-xdebug \

curl -sS https://getcomposer.org/installer | \
	php -- --install-dir=/usr/local/bin --filename=composer

echo '<?php phpinfo();' | sudo tee /var/www/html/phpinfo.php

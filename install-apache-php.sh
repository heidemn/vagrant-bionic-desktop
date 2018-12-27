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
	php-memcached \
	php-mongodb \
	php-mysql \
	php-xdebug \

if [ ! -f /usr/local/bin/composer ]; then
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
fi

echo '<?php phpinfo();' | sudo tee /var/www/html/phpinfo.php

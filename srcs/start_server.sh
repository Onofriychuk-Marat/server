#!/bin/bash

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

cp default_index /etc/nginx/sites-available/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/phpmyadmin
rm -f phpMyAdmin-4.9.0.1-all-languages.tar.gz
cp phpmyadmin.inc.php /var/www/phpmyadmin/config.inc.php

tar -xzvf wordpress-5.5.1.tar.gz
cp -r wordpress/. /var/www/wordpress
rm -f wordpress-5.5.1.tar.gz
cp wp-config.php /var/www/wordpress/

mkdir /etc/nginx/ssl
mv server.crt /etc/nginx/ssl/server.crt
mv server.key /etc/nginx/ssl/server.key

service nginx start
service mysql start
service php7.3-fpm start

bash

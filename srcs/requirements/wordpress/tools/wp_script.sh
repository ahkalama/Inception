#!/bin/bash

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DB_NAME/g" wp-config-sample.php
mv wp-config-sample.php wp-config.php

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ROOT --admin_password=$WP_ROOT_PASSWORD --admin_email=$WP_EMAIL --allow-root
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_PASSWORD --allow-root
wp theme install hestia --activate --allow-root

exec "$@"

#!/bin/sh

# Download and install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download and install WordPress
wp core download \
    --path=/var/www/html \
    --allow-root

# Create the wp-config.php file
wp config create \
    --path=/var/www/html \
    --dbhost=$MARIADB_HOST \
    --dbname=$MARIADB_NAME \
    --dbuser=$MARIADB_USER \
    --dbpass=$MARIADB_PASSWORD \
    --allow-root

# Install WordPress
wp core install \
    --path=/var/www/html \
    --url=$WORDPRESS_URL \
    --title=$WORDPRESS_TITLE \
    --admin_user=$WORDPRESS_ROOT_USER \
    --admin_password=$WORDPRESS_ROOT_PASSWORD \
    --admin_email=$WORDPRESS_ROOT_EMAIL \
    --allow-root

# Create random user
wp user create \
    $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
    --role=author \
    --user_pass=$WORDPRESS_USER_PASSWORD \
    --allow-root \
    --path=/var/www/html

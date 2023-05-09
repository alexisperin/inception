#!/bin/sh

envsubst < /wordpress_init.sh | sponge /wordpress_init.sh

if [ ! -f /var/www/html/wp-config.php ]; then
    /wordpress_init.sh
fi

php-fpm7.3 -F

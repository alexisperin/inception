FROM debian:buster

RUN apt-get -y update && apt-get install -y php-fpm php-mysql curl net-tools mariadb-client
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.3/fpm/php.ini
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/wordpress.sh /
COPY tools/wordpress_init.sh /
RUN chmod +x /wordpress.sh
RUN chmod +x /wordpress_init.sh

ENTRYPOINT ["/wordpress.sh"]

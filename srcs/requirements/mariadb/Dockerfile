FROM debian:buster

RUN apt-get -y update && apt-get install -y mariadb-server moreutils gettext
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

COPY tools/mariadb.sh /
COPY tools/wordpress.sql /
RUN chmod +x /mariadb.sh

ENTRYPOINT ["/mariadb.sh"]

FROM debian:buster

RUN apt-get -y update && apt-get install -y nginx openssl
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl

COPY conf/my-nginx.conf /etc/nginx/sites-enabled/default

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/aperin.key -out /etc/nginx/ssl/aperin.crt -subj "/CN=aperin"

# req: subcommand used to create and process certificate siging requests
# -x509: create self-signed SSL certificate
# -nodes: specifies that we don't want to use a passphrase to protect the private key
# -days 365: number of days the SSL certificate is valid for
# -newkey rsa:2048: to generate a new rsa private key with a length of 2048 bits
# -keyout /etc/ssl/private/nginx.key: where to save the rsa private key
# -out /etc/ssl/certs/nginx.cert: where to save the SSL certificate
# -subj: subject of the certificate (country, location, organization, organization unit, common name)

CMD ["nginx", "-g", "daemon off;"]

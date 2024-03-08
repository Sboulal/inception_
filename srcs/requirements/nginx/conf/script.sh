#!/bin/bash

#creating certificate

openssl req -x509 -nodes -days 120 -newkey rsa:2048 -keyout $CERTS_KEY -out $CERTS_ -subj "/C=MA/ST=Béni Mellal-Khenifra/L=Khouribga/O=1337/OU=Student/CN=$DOMAIN_NAME"

#configuring ngnix

echo "
  server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name $DOMAIN_NAME;
    
    ssl_certificate $CERTS_;
    ssl_certificate_key $CERTS_KEY;
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ \.php$ {
      include snippets/fastcgi-php.conf;
      fastcgi_pass wordpress:9000;
    }
  }

" > /etc/nginx/sites-available/default

#opening nginx in foreground

nginx -g "daemon off;"
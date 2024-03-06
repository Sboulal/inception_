FROM debian:buster


RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx-full

RUN apt-get -y install curl net-tools openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=MO/ST=khouribga/L=khouribga/O=inception/CN=fael-bou.42.fr"

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html && \
	chmod -R 755 /var/www/html

CMD ["nginx", "-g", "daemon off;"]

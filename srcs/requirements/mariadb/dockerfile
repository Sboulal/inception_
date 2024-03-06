FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server default-mysql-client vim

RUN mkdir -p /var/run/mysql
RUN cd /var/run/mysql
RUN chown -R mysql:mysql /var/run/mysql

COPY ./tools/script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]

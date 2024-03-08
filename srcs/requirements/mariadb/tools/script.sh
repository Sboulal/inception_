#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' ;" >> db
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db
echo "FLUSH PRIVILEGES;" >> db

mysql -uroot -p12345 < db

mariadb-admin -p$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe
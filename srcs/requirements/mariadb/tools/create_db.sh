#!/bin/bash

service mysql start

echo "DB_NAME: ${DB_NAME}"
echo "DB_USER: ${DB_USER}"
echo "DB_USER_PASSWORD: ${DB_USER_PASSWORD}"
echo "DB_ROOT_PASSWORD: ${DB_ROOT_PASSWORD}"

echo "CREATE DATABASE ${DB_NAME};"
mysql -u root -e "CREATE DATABASE ${DB_NAME};"

echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"

echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"

echo "FLUSH PRIVILEGES;"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
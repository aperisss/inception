service mysql start

CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER 'aperis'@'%';
SET PASSWORD FOR 'aperis'@'%' = PASSWORD('perisa');
GRANT ALL PRIVILEGES ON wordpress.* TO 'aperis'@'%' IDENTIFIED BY 'perisa';
FLUSH PRIVILEGES;
#!/bin/bash

sed -ie 's/$DB_USER/'$DB_ADMIN'/' /var/www/wordpress/wp-config.php # replace $DB_USER by $DB_ADMIN in wp-config.php file 
sed -ie 's/$DB_NAME/'$DB_DATA_BASE_NAME'/' /var/www/wordpress/wp-config.php # replace $DB_NAME by $DB_DATA_BASE_NAME in wp-config.php file
sed -ie 's/$DB_PASSWORD/'$DB_ADMIN_PASSWORD'/' /var/www/wordpress/wp-config.php # replace $DB_PASSWORD by $DB_ADMIN_PASSWORD in wp-config.php file

if [ -f "/var/www/wordpress/conf" ];then # if conf file exists 
    echo "" # do nothing 
else
    cd /var/www/wordpress # go to wordpress directory  

	sleep 10; # wait for mysql to be ready to accept connections 
	
    wp core --allow-root download --locale=fr_FR
    
    wp core --allow-root install --url="https://mabid.42.fr/" --title="Inception mabid" --admin_name=$WP_ADMIN_USER --admin_email=$WP_ADMIN_EMAIL --admin_password=$WP_ADMIN_PASSWORD; 
    # install wordpress

    wp --allow-root user create $WP_USER other@gmail.com --user_pass=$WP_USER_PASSWORD
    # create other user

    touch conf # create conf file to know that wordpress is configured
fi

exec /usr/sbin/php-fpm7.3 -F -R # start php-fpm server in foreground mode and restart it if it crashes 
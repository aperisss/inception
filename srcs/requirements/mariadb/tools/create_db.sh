if [ -f "/var/lib/mysql/entry" ];then 
    exec mysqld         
    exit       

else 
    service mysql restart  
    
    mysql -e "CREATE DATABASE $DB_NAME" 
    

    mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; GRANT ALL PRIVILEGES ON $DB__NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' WITH GRANT OPTION; flush privileges;" 
    
    mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD') ; flush privileges ;" 
    #change the root password to $WP_BASE_PASS
    
    touch /var/lib/mysql/entry

    chmod 777 /var/lib/mysql/*
    
    exec mysqld_safe
fi
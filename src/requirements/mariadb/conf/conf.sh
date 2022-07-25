if [ ! -d /var/lib/mysql/${MARIADB_DATABASE}]; then
    mysqld &
    until mysqladmin ping; do
        sleep 2
    done
	mysql -u root -e "CREATE DATABASE $MARIADB_DATABASE;"
    mysql -u root -e "CREATE USER '$MARIADB_ADMIN'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD';"
    mysql -u root -e "GRANT ALL ON *.* TO '$MARIADB_ADMIN'@'%';"
	mysql -u root -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
    mysql -u root -e "GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    killall mysqld
fi

mysqld

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html/
	wp core download --allow-root
	until mysqladmin -hmariadb -u${MARIADB_USER} -p${MARIADB_USER_PASSWORD} ping; do
       sleep 2
    done
	wp config create --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASSWORD} --dbhost=mariadb:3306 --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="$WP_ADMIN@student.42.fr" --allow-root
	wp user create ${WP_USER} "$WP_USER"@user.com --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
fi

exec /usr/sbin/php-fpm7.3 -F

#!/bin/bash
# sleep 100;
echo "wp config create";
sleep 10000;
# si le fichier wp-config.php n'existe pas, on le crée maybe
# if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --path='/var/www/wordpress'
# fi
# wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306 --path='/var/www/wordpress'
# deuxieme etape, on installe wordpress
echo "wp core install";
wp core install	--allow-root \
                --admin_user=$WP_USER \
                --admin_password=$WP_PASSWORD \
                --path='/var/www/wordpress' \
                --admin_email="ccravero@42.fr"\
                --url="https://ccravero.42.fr"\
                --title="ccravero's wordpress";
# on cree un second utilisateur
echo "wp user create";
wp user create $WP_USER2  ccravero2@42.fr --path='/var/www/wordpress' --allow-root --user_pass=$WP_PASSWORD2;
echo "user created";
exec /usr/sbin/php-fpm7.3 -F;
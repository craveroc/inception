#!/bin/bash
sleep 10;
echo "wp config create"
# si le fichier wp-config.php n'existe pas, on le crée maybe
wp config create --allow-root \
                --dbname=$DB_NAME \
                --dbuser=$DB_USER \
                --dbpass=$DB_PASS \
                --dbhost=mariadb:3306 --path='/var/www/wordpress'
# deuxieme etape, on installe wordpress
echo "wp core install"
wp core install	--allow-root \
                --admin_user=$WP_USER \
                --admin_password=$WP_PASSWORD \
                --path='/var/www/wordpress' ;
# on cree un second utilisateur
echo "wp user create"
wp user create $WP_USER2 --user_pass=$WP_PASSWORD2;

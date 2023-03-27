#! /bin/bash
DOMAIN_NAME=ccravero.42.fr

DB_NAME=wordpress
DB_USER=ccravero
DB_PASS=cmonmotdepasse
DB_ROOT_PASS=cmonmotdepasse2

WP_USER=ccravero
WP_PASS=cmonmotdepasse3
WP_USER2=ccravero2
WP_PASS2=cmonmotdepasse4
service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
sleep 1
mysql -e "USE $DB_NAME;CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
sleep 1
mysql -e "USE $DB_NAME;GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
sleep 1
mysql -e "USE $DB_NAME;ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
sleep 1
mysql -u root -p"$DB_ROOT_PASS" -e "USE $DB_NAME;FLUSH PRIVILEGES;"
sleep 1
# service mysql status
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown
exec mysqld_safe
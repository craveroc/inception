#! /bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
sleep 1
mysql -e "USE $DB_NAME;CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
sleep 1
mysql -e "USE $DB_NAME;GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
sleep 1
mysql -e "USE $DB_NAME;ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
sleep 1
mysql -u root -p"$DB_ROOT_PASS" -e "USE $DB_NAME;FLUSH PRIVILEGES;"
sleep 1
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown
exec mysqld_safe
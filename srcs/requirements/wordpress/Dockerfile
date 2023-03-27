FROM debian:buster

RUN apt update
RUN apt-get install curl wget php7.3-fpm php7.3-cli php7.3-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xvf latest.tar.gz
COPY ./php.ini /etc/php/7.3/fpm/php.ini

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN chown -R root:root /var/www/wordpress
COPY ./tools/wpstart.sh /tmp/wpstart.sh
RUN chmod 755 /tmp/wpstart.sh
ENTRYPOINT [ "/tmp/wpstart.sh" ]
CMD [ "/usr/sbin/php-fpm7.3" "-F"]
# CMD bash

#apt install wget
#wget https;//wordpress.org/latest.tar.gz
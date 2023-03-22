FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/key.crt -keyout /etc/nginx/ssl/key.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ccravero.42.fr/UID=ccravero"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/wordpress
# RUN chown -R /var/www/wordpress
CMD nginx -g "daemon off;"
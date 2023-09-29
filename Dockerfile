FROM php:8.2-apache

LABEL MAINTAINER Mehmood Asghar

COPY php.ini /usr/local/etc/php/
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get update 

#RUN ls -l \
#    && ls -l /var/www/html

RUN chown -R www-data:www-data /var/www/html/ \
    && a2enmod rewrite

RUN pear config-set php_ini /usr/local/etc/php/php.ini

##for xsl extension for php
RUN apt install -y libxslt-dev

##for gd ext
RUN apt-get update -y && apt-get install -y libpng-dev

RUN docker-php-ext-install mysqli gd
#mbstring gd 
#pdo pdo_mysql

#install mysql client and nano
#RUN apt-get update && apt-get install -y mariadb-client && apt-get install -y nano

#RUN php -v && php -m && ls -l /var/www/html/

RUN service apache2 restart

EXPOSE 80 3306
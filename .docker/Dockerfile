FROM php:7.3-apache

MAINTAINER Mehmood Asghar

COPY .docker/php.ini /usr/local/etc/php/
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get update
RUN apt-get -y install wget zip
#RUN apt-get -y install git

#download zipped version of nada master branch
RUN wget https://github.com/ihsn/nada/archive/master.zip
RUN unzip master.zip
RUN mv nada-master nada

COPY database.php /var/www/html/nada/application/config/database.php
#COPY info.php /var/www/html/nada
RUN ls -l 
RUN ls -l /var/www/html

RUN chown -R www-data:www-data /var/www/html/nada \
    && a2enmod rewrite

##for xsl extension for php 5x
RUN apt install -y libxslt-dev

##for gd ext
RUN apt-get update -y && apt-get install -y libpng-dev

##required extension for NADA
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN docker-php-ext-install mbstring

## Install XSL
RUN docker-php-ext-install xsl

RUN php -m

EXPOSE 80 3306

    

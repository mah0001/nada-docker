#FROM php:5.6-apache
FROM php:7.1.8-apache

MAINTAINER Mehmood Asghar

COPY .docker/php.ini /usr/local/etc/php/
#COPY . /app
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

#RUN apt-get update -y
#RUN apt-get install -y libxslt
#RUN apt-get install -y php-xml
#RUN apt-get install -y apt-utils
#RUN apt-get install -y libxslt-dev
#RUN apt-get install -y php5-xsl

RUN apt update
RUN apt-get -y install wget zip

RUN wget https://github.com/ihsn/nada/archive/feature-single-search.zip
RUN unzip feature-single-search.zip
RUN mv nada-feature-single-search nada
COPY database.php /var/www/html/nada/application/config/database.php
COPY info.php /var/www/html/nada
RUN ls -l 
RUN ls -l /var/www/html

RUN chown -R www-data:www-data /var/www/html/nada \
    && a2enmod rewrite



#RUN apt upgrade -y
#RUN apt install -y apt-utils

##for xsl extension for php 5x
RUN apt install -y libxslt-dev

##for gd ext
RUN apt install -y libpng12-dev

##required extension for NADA
#RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN docker-php-ext-install mbstring

## Install XSL
RUN docker-php-ext-install xsl

RUN php -m



    

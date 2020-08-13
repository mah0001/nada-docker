FROM php:7.3-apache

MAINTAINER Mehmood Asghar

COPY php.ini /usr/local/etc/php/
COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get update
RUN apt-get -y install wget zip
RUN apt-get -y install git

#download zipped version of nada master branch
#RUN wget https://github.com/ihsn/nada/archive/master.zip
#RUN unzip master.zip
#RUN mv nada-master nada

RUN git clone https://github.com/ihsn/nada.git nada
RUN cd nada && git checkout develop

COPY database.php /var/www/html/nada/application/config/database.php
COPY db_test.php /var/www/html/nada
#COPY info.php /var/www/html/nada
RUN ls -l 
RUN ls -l /var/www/html

RUN chown -R www-data:www-data /var/www/html/nada \
    && a2enmod rewrite

##for xsl extension for php 5x
RUN apt install -y libxslt-dev

##for gd ext
RUN apt-get update -y && apt-get install -y libpng-dev

## Install XSL
RUN docker-php-ext-install xsl

ENV ACCEPT_EULA=Y

# Microsoft SQL server installation
# sources:
# [odbc drivers]  https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15
#
RUN apt-get install -y gnupg
RUN apt-get update \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list \
        > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get install -y --no-install-recommends \
        locales \
        apt-transport-https \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        unixodbc-dev \
        msodbcsql17

RUN docker-php-ext-install mbstring gd pdo pdo_mysql \
    && pecl install sqlsrv pdo_sqlsrv xdebug \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv xdebug

RUN php -m

EXPOSE 80

    

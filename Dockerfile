# FROM php:7.2-apache
# RUN apt-get update && apt upgrade -y
# RUN apt-get -y install mcrypt-1.0.1 install php7.2-dev install libmcrypt-dev gcc make autoconf libc-dev pkg-config docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli
# COPY . .
##RUN php composer.phar update
#RUN php composer.phar install
# CMD php artisan serve


FROM php:5.6-apache
RUN apt-get update && apt upgrade -y
COPY . .
RUN apt-get -y install gcc make nano git autoconf libc-dev mariadb-client pkg-config libmcrypt-dev unzip
# &&  pecl install mcrypt-1.0.1
RUN echo '\n extension=mcrypt.so' >> /usr/local/etc/php/conf.d/docker-php-ext-sodium.ini 
RUN docker-php-ext-install pdo pdo_mysql mcrypt 
RUN php composer.phar  update
RUN php composer.phar  install
CMD php artisan serve --host=0.0.0.0 --port=8181
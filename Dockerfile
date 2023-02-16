


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
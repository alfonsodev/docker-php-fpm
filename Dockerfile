FROM php:5.6.8-fpm

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        zlib1g-dev \
        g++

RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install mysql 
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install opcache
RUN apt-get install -y php5-mysqlnd 
RUN apt-get install -y php5-snmp 
RUN apt-get install -y php5-tidy
RUN apt-get install -y php5-xmlrpc
RUN apt-get install -y php5-xsl
RUN apt-get install -y php5-imagick
RUN apt-get install -y php5-memcached
RUN apt-get install -y php5-memcache 
RUN apt-get install -y php5-redis 
# RUN apt-get install -y php5-newrelic 
RUN apt-get install -y php5-mongo 
# missing folders
RUN mkdir -p /usr/local/etc/php/conf.d
RUN mkdir -p /usr/local/etc/php/log/
RUN touch /usr/local/etc/php/log/fpm_error.log
RUN ln -s /etc/php5/mods-available/mysqlnd.ini  /usr/local/etc/php/conf.d/mysqlnd.ini
RUN ln -s /etc/php5/mods-available/snmp.ini  /usr/local/etc/php/conf.d/snmp.ini
RUN ln -s /etc/php5/mods-available/tidy.ini /usr/local/etc/php/conf.d/tidy.ini
RUN ln -s /etc/php5/mods-available/xmlrpc.ini /usr/local/etc/php/conf.d/xmlrpc.ini
RUN ln -s /etc/php5/mods-available/xsl.ini /usr/local/etc/php/conf.d/xsl.ini
RUN ln -s /etc/php5/mods-available/imagick.ini /usr/local/etc/php/conf.d/imagick.ini
RUN ln -s /etc/php5/mods-available/memcached.ini /usr/local/etc/php/conf.d/memcached.ini
RUN ln -s /etc/php5/mods-available/memcache.ini  /usr/local/etc/php/conf.d/memcache.ini
RUN ln -s /etc/php5/mods-available/redis.ini  /usr/local/etc/php/conf.d/redis.ini

CMD ["php-fpm"]



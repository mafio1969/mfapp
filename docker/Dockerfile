# Changes needed on the Dockerfile from PHP 7.3 to 7.4 :
# - gd configure options changed (from "--with-jpeg-dir=/usr/include/" to "--with-jpeg")
# - it is now required to install oniguruma lib for mbstring

# Pull base image.
FROM actency/docker-apache-php:7.4

# Install xdebug. ver 2.9
RUN cd /tmp/ && wget http://xdebug.org/files/xdebug-2.9.0.tgz && tar -xvzf xdebug-2.9.0.tgz && cd xdebug-2.9.0/ && phpize && ./configure --enable-xdebug --with-php-config=/usr/local/bin/php-config && make && make install
RUN cd /tmp/xdebug-2.9.0 && cp modules/xdebug.so /usr/local/lib/php/extensions/
RUN echo 'zend_extension = /usr/local/lib/php/extensions/xdebug.so' >> /usr/local/etc/php/php.ini
RUN touch /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_autostart=0' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_connect_back=0' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_log=/tmp/php7-xdebug.log' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.remote_host=docker_host' >> /usr/local/etc/php/conf.d/xdebug.ini &&\
  echo 'xdebug.idekey=PHPSTORM' >> /usr/local/etc/php/conf.d/xdebug.ini

COPY config/ini/php.ini /usr/local/etc/php/

# Set and run a custom entrypoint
COPY core/docker-entrypoint.sh /
RUN chmod 777 /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
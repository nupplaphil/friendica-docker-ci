FROM debian:jessie

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        apt-get install -y php5-gd git curl \
        php5-cli php5-curl php5-mcrypt php5-mysql wget make \
        php5-redis php5-memcached php5-memcache php5-json php5-mcrypt \
        ; \
        rm -rf /var/lib/apt/lists/*;

RUN php5enmod curl pdo pdo_mysql gd opcache json mcrypt
RUN curl -O -L https://phar.phpunit.de/phpunit-5.5.4.phar; \
    chmod +x phpunit-5.5.4.phar; \
    mv phpunit-5.5.4.phar /usr/local/bin/phpunit;
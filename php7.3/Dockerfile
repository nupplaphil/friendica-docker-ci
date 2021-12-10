FROM debian:buster

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget gnupg2 apt-transport-https lsb-release ca-certificates mariadb-client; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y php7.3-gd git curl openssl \
        php7.3-cli php7.3-curl php7.3-mysql wget make \
        php7.3-redis php7.3-memcached php7.3-memcache php7.3-json \
        php7.3-apcu php7.3-xdebug php7.3-xml php7.3-zip php7.3-dev php7.3-mbstring; \
        apt-get autoremove -y; apt-get autoclean; apt-get clean; \
        rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*;

RUN phpenmod curl pdo pdo_mysql xml gd zip opcache mbstring posix ctype json iconv pcntl openssl

RUN set -ex; \
        curl -O -L https://phar.phpunit.de/phpunit-9.phar; \
        chmod +x phpunit-9.phar; \
        mv phpunit-9.phar /usr/local/bin/phpunit;
RUN set -ex; \
        curl -O -L https://getcomposer.org/download/1.6.2/composer.phar; \
        chmod +x composer.phar; \
        mv composer.phar /usr/local/bin/composer;

RUN phpdismod xdebug
ADD php.ini /etc/php/7.3/cli/conf.d/friendica.ini

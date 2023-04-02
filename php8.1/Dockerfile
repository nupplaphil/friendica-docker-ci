FROM debian:buster

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget gnupg2 apt-transport-https lsb-release ca-certificates mariadb-client; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y php8.1-gd git curl openssl \
        php8.1-cli php8.1-curl php8.1-mysql wget make \
        php8.1-redis php8.1-memcached php8.1-memcache \
        php8.1-apcu php8.1-xdebug php8.1-xml php8.1-zip php8.1-dev php8.1-mbstring; \
        apt-get autoremove -y; apt-get autoclean; apt-get clean; \
        rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*;

RUN phpenmod curl pdo pdo_mysql xml gd zip opcache mbstring posix ctype iconv pcntl openssl

RUN set -ex; \
        curl -O -L https://phar.phpunit.de/phpunit-9.phar; \
        chmod +x phpunit-9.phar; \
        mv phpunit-9.phar /usr/local/bin/phpunit;
RUN set -ex; \
        curl -O -L https://getcomposer.org/download/1.10.15/composer.phar; \
        chmod +x composer.phar; \
        mv composer.phar /usr/local/bin/composer;

RUN phpdismod xdebug
ADD php.ini /etc/php/8.1/cli/conf.d/friendica.ini

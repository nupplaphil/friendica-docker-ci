FROM debian:bookworm

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget gnupg2 apt-transport-https lsb-release ca-certificates mariadb-client; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y php7.4-gd git curl openssl \
        php7.4-cli php7.4-curl php7.4-mysql wget make \
        php7.4-redis php7.4-memcached php7.4-memcache php7.4-json \
        php7.4-apcu php7.4-xdebug php7.4-xml php7.4-zip php7.4-dev php7.4-mbstring; \
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
ADD php.ini /etc/php/7.4/cli/conf.d/friendica.ini

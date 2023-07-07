FROM debian:bookworm

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget gnupg2 apt-transport-https lsb-release ca-certificates mariadb-client; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y php8.0-gd git curl openssl \
        php8.0-cli php8.0-curl php8.0-mysql wget make \
        php8.0-redis php8.0-memcached php8.0-memcache \
        php8.0-apcu php8.0-xdebug php8.0-xml php8.0-zip php8.0-dev php8.0-mbstring; \
        apt-get autoremove -y; apt-get autoclean; apt-get clean; \
        rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*;

RUN phpenmod curl pdo pdo_mysql xml gd zip opcache mbstring posix ctype iconv

RUN set -ex; \
        curl -O -L https://phar.phpunit.de/phpunit-9.phar; \
        chmod +x phpunit-9.phar; \
        mv phpunit-9.phar /usr/local/bin/phpunit;
RUN set -ex; \
        curl -O -L https://getcomposer.org/download/1.10.15/composer.phar; \
        chmod +x composer.phar; \
        mv composer.phar /usr/local/bin/composer;

RUN phpdismod xdebug
ADD php.ini /etc/php/8.0/cli/conf.d/friendica.ini

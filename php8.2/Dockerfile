FROM debian:bookworm

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y wget gnupg2 apt-transport-https lsb-release ca-certificates mariadb-client; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        DEBIAN_FRONTEND=noninteractive apt-get install -q -y php8.2-gd git curl openssl \
        php8.2-cli php8.2-curl php8.2-mysql wget make \
        php8.2-redis php8.2-memcached php8.2-memcache \
        php8.2-apcu php8.2-xdebug php8.2-xml php8.2-zip php8.2-dev php8.2-mbstring; \
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
ADD php.ini /etc/php/8.2/cli/conf.d/friendica.ini

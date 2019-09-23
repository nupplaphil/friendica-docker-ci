FROM debian:jessie

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        apt-get install -y wget gnupg2 libzip2 apt-transport-https lsb-release ca-certificates; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        apt-get install -y php7.2-gd git curl openssl \
        php7.2-cli php7.2-curl php7.2-mysql wget make \
        php7.2-redis php7.2-memcached php7.2-memcache php7.2-json \
        php7.2-apcu php7.2-xdebug php7.2-xml php7.2-zip php7.2-dev php7.2-mbstring \
        ; \
        rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*;

RUN phpenmod curl pdo pdo_mysql xml gd zip opcache mbstring posix ctype json iconv pcntl openssl
RUN phpdismod xdebug
ADD php.ini /etc/php/7.1/cli/conf.d/friendica.ini
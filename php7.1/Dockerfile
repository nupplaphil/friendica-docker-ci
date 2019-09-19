FROM debian:jessie

# install the PHP extensions we need
# see https://friendi.ca/resources/requirements/
RUN set -ex; \
        apt-get update; \
        apt-get install -y wget gnupg2 libzip2 apt-transport-https lsb-release ca-certificates; \
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
        echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list; \
        apt-get update; \
        apt-get install -y php7.1-gd git curl \
        php7.1-cli php7.1-curl php7.1-mcrypt php7.1-mysql wget make \
        php7.1-redis php7.1-memcached php7.1-memcache php7.1-json php7.1-mcrypt \
        php7.1-apcu php7.1-xdebug php7.1-xml php7.1-zip php7.1-dev php7.1-mbstring \
        ; \
        rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*;

RUN phpenmod curl pdo pdo_mysql xml gd zip opcache mbstring posix ctype json iconv pcntl
RUN phpdismod xdebug
ADD php.ini /etc/php/7.1/cli/conf.d/friendica.ini
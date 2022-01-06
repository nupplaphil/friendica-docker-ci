FROM php:7.4

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
        git \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY check-php-cs.sh /check-php-cs.sh
COPY check-license.sh /check-license.sh

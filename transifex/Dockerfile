FROM ubuntu:20.04

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
        gettext \
        git \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY check-messages.sh /check-messages.sh
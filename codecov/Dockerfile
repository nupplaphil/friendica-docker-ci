FROM alpine

RUN set -eux; \
    apk add --no-cache --virtual .gosu-deps \
    		ca-certificates \
            curl \
    		dpkg \
    		gnupg \
            perl-utils \
    	; \
# verify the signature
    export GNUPGHOME="$(mktemp -d)"; \
    curl https://keybase.io/codecovsecurity/pgp_keys.asc | gpg --no-default-keyring --keyring trustedkeys.gpg --import; \
    curl -Os https://uploader.codecov.io/latest/alpine/codecov; \
    curl -Os https://uploader.codecov.io/latest/alpine/codecov.SHA256SUM; \
    curl -Os https://uploader.codecov.io/latest/alpine/codecov.SHA256SUM.sig; \
    gpgv codecov.SHA256SUM.sig codecov.SHA256SUM; \
    shasum -a 256 -c codecov.SHA256SUM; \
    command -v gpgconf && gpgconf --kill all || :; \
    rm -rf "$GNUPGHOME" codecov.SHA256SUM codecov.SHA256SUM.sig; \
    mv codecov /usr/local/bin/codecov; \
# clean up fetch dependencies
    apk del --no-network .gosu-deps; \
    chmod +x /usr/local/bin/codecov; \
    codecov --version;

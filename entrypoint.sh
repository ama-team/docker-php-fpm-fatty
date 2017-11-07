#!/usr/bin/env bash

if [ ! -z ${FATTY_EXTENSION_XDEBUG+exists} ]; then
    docker-php-ext-enable xdebug
fi

exec /usr/local/bin/dockerize \
    -template /usr/local/etc/php/conf.template.d:/usr/local/etc/php/conf.d \
    /usr/local/bin/docker-php-entrypoint "$@"

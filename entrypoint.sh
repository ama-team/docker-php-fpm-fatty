#!/usr/bin/env bash

exec /usr/local/bin/dockerize \
    -template /usr/local/etc/php/conf.template.d:/usr/local/etc/php/conf.d \
    /usr/local/bin/docker-php-entrypoint "$@"

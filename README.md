# ama-team/php-fpm-fatty Docker image

This repository contains temporary project for building heavily bundled
PHP-FPM Docker image. As many other organizations, we need to run our
PHP applications somewhere, and that's somewhere has to have some PHP 
extensions and binaries.

This docker image is based on php:7.1-fpm Debian image. We may migrate 
to Alpine later.

What's bundled in:

- PHP CLI and FPM 7.1
- Standard extensions:
    - bcmath
    - bz2
    - curl
    - dom
    - exif
    - fileinfo
    - ftp
    - gd 
    - gettext
    - gmp
    - hash
    - iconv
    - imap
    - intl
    - json
    - mbstring
    - mcrypt
    - mysqli
    - opcache
    - pcntl
    - pdo, pdo_mysql, pdo_pgsql, pdo_sqlite
    - pgsql
    - phar
    - session
    - xml
    - zip
- PECL extensions
    - apcu
    - xdebug
- Customized php.ini
- Composer
- [/usr/local/bin/zopfli and /usr/local/bin/zopflipng][zopfli]
- [/usr/local/bin/jpegoptim][jpegoptim]
- [/usr/local/bin/dockerize][dockerize]

# Environment options

## php.ini

All environment options starting with `FATTY_INI_` are processed using 
following rules:
 - `FATTY_INI_` prefix is stripped off
 - double underscore is replaced with dot
 - result is lowercased and printed as '%result% = %value'
 
Following examples will demonstrate it:

| Variable                           | Value                | Result                              |
|:-----------------------------------|:---------------------|:------------------------------------|
| `PHP_INI_DIR`                      | `/usr/local/etc/php` | No result - prefix mismatch         |
| `FATTY_INI_MEMORY_LIMIT`           | `128M`               | `memory_limit = 128M`               |
| `FATTY_INI_XDEBUG__COLLECT_RETURN` | `true`               | `xdebug.collect_return = true`      |

  [zopfli]: https://github.com/google/zopfli
  [jpegoptim]: https://github.com/tjko/jpegoptim
  [dockerize]: https://github.com/jwilder/dockerize

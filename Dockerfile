FROM in2code/php:7.2-fpm

USER root

# php imagick
RUN apt-get update && apt-get install -y libzip-dev libjpeg-dev libpng-dev libmagickwand-dev imagemagick --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick && docker-php-ext-enable imagick

ARG uid=1000
ARG gid=1000

USER ${uid}:${gid}

FROM selenium/standalone-chrome-debug:latest
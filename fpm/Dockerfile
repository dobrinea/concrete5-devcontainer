# From official php image.
ARG PHP_VERSION=8.0
FROM php:${PHP_VERSION}-fpm-bullseye
ARG LOCALE=en_US.UTF-8
ARG TIME_ZONE=UTC
ENV LANG=${LOCALE}
ENV TZ=${TIME_ZONE}
# Install postgres pdo driver.
ENV PKG="bash-completion dnsutils imagemagick jq locales default-mysql-client rsync tree unzip vim wget zip"
ENV PKG_LIB="libc-client-dev libfreetype6-dev libjpeg62-turbo-dev libkrb5-dev libmagickwand-dev libonig-dev libpng-dev libpq-dev libxslt-dev libzip-dev"
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends $PKG $PKG_LIB \
    && pecl install imagick xdebug-3.1.3 \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure gd \
        --with-jpeg=/usr/include/ \
        --with-freetype=/usr/include/ \
    && docker-php-ext-enable imagick xdebug \
    && docker-php-ext-install bcmath gd imap intl pdo_mysql xml zip \
    #
    # locale
    && sed -i -E "s/# (${LOCALE})/\1/" /etc/locale.gen \
    && locale-gen ${LOCALE} \
    && dpkg-reconfigure locales \
    && update-locale LANG=${LOCALE} \
    #
    # timezone
    && ln -snf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && echo ${TIME_ZONE} > /etc/timezone

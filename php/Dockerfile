
ARG php_version=8.5
FROM php:${php_version}-cli

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV BUILD_DEPS="autoconf file pkg-config re2c python3"
ENV LIB_DEPS="zlib1g-dev libzip-dev"
ENV TOOL_DEPS="git build-essential zip unzip p7zip-full"
ENV DEPLOYMENT_DEPS="openssh-client rsync"
ENV ICU_RELEASE='78.1'
ENV CXXFLAGS='-std=c++23'

RUN apt-get update && apt-get install -y --no-install-recommends $BUILD_DEPS $LIB_DEPS $TOOL_DEPS $DEPLOYMENT_DEPS && rm -rf /var/lib/apt/lists/* \
 && echo "date.timezone=Europe/Amsterdam" >> $PHP_INI_DIR/php.ini \
 && docker-php-ext-install zip

RUN cd /tmp && curl -Ls https://github.com/unicode-org/icu/releases/download/release-$ICU_RELEASE/icu4c-$ICU_RELEASE-sources.tgz > icu4c-sources.tgz \
 && cd /tmp && tar xzf icu4c-sources.tgz && cd /tmp/icu/source && ./runConfigureICU Linux && make -j 10 && make install && rm -rf /tmp/icu /tmp/icu4c-sources.tgz
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN apt-get purge -y --auto-remove $BUILD_DEPS

# Install composer (+ update)
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer self-update

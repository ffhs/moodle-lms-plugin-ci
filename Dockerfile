# syntax=docker/dockerfile:1.4
ARG PHP_VERSION=8.3
FROM moodlehq/moodle-php-apache:${PHP_VERSION}

LABEL org.opencontainers.image.title ="moodle-lms-plugin-ci" \
      org.opencontainers.image.description="Prebuilt Moodle Plugin CI image for faster testing." \
      org.opencontainers.image.version="${PHP_VERSION}"

ENV DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1 \
    LANG=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LC_ALL=C.UTF-8

# Install dependencies, Node.js 22, and Composer
RUN set -eux; \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get update -yqq && \
    apt-get -yqq install --no-install-suggests default-jre-headless mariadb-client git unzip curl locales nodejs rsync postgresql-client && \
    php -r "copy('https://getcomposer.org/installer','composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php && \
    composer create-project -n --no-dev --prefer-dist moodlehq/moodle-plugin-ci /opt/moodle-plugin-ci "^4.5.9" && \
    ln -s /opt/moodle-plugin-ci/bin/moodle-plugin-ci /usr/local/bin/moodle-plugin-ci && \
    ln -s /opt/moodle-plugin-ci/vendor/bin/* /usr/local/bin/ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Default command to show version
CMD ["moodle-plugin-ci", "-V"]

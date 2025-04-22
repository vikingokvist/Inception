FROM alpine:3.19

# Add the community repository to install PHP packages
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories

# Install PHP 8.2 and required extensions
RUN apk update && apk upgrade  && \
    apk add \
        php82 \
        php82-fpm \
        php82-mysqli \
        php82-opcache \
        php82-json \
        php82-mbstring

# Copy PHP-FPM pool configuration
COPY www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["php-fpm82", "-F"]

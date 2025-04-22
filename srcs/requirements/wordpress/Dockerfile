FROM alpine:3.19


RUN apk update && apk upgrade && apk add \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-opcache \
    php82-json \
    php82-mbstring \
    php82-curl \
    php82-xml \
    php82-zip \
    php82-session \
    php82-fileinfo \
    bash \
    && rm -rf /var/cache/apk/*


COPY www.conf /etc/php82/php-fpm.d/

WORKDIR /var/www/html

CMD ["php-fpm82", "-F"]

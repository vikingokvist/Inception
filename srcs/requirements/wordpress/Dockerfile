FROM alpine:3.19

RUN apk update && apk upgrade  && apk add \
    php82 php82-fpm php82-mysqli php82-opcache php82-json php82-mbstring
    
COPY www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["php-fpm82", "-F"]

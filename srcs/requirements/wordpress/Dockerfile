FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache \
	php php-common php-fpm php-mysqli php-json php-session php-zlib php-gd php-mbstring \
	php-openssl php-curl php-dom php-phar php-simplexml php-xmlwriter php-tokenizer php-zip \
	wget \
	tar \
	mariadb-client \
	curl

RUN echo 'memory_limit = 256M' >> /etc/php83/php.ini

RUN curl -L https://github.com/wp-cli/wp-cli/releases/download/v2.7.1/wp-cli-2.7.1.phar \
	-o /usr/local/bin/wp && chmod +x /usr/local/bin/wp


COPY ./entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

CMD ["php-fpm83", "-F", "--nodaemonize"]

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
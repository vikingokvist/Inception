FROM alpine:3.19


RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories


RUN apk update && apk upgrade && \
    apk add --no-cache nginx openssl ca-certificates \
    && update-ca-certificates


RUN mkdir -p /etc/ssl/certs /etc/ssl/private && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/CN=localhost"


COPY default.conf /etc/nginx/default.conf

CMD ["nginx", "-g", "daemon off;"]

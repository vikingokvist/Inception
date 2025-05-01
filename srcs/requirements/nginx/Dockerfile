FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache \
    nginx \
    openssl \
    ca-certificates \
    && update-ca-certificates

RUN mkdir -p /etc/nginx/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/nginx-selfsigned.key \
    -out /etc/nginx/certs/nginx-selfsigned.crt \
    -subj "/CN=ctommasi.42.fr"


COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

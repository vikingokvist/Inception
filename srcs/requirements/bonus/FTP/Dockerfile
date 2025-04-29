FROM alpine:3.20


RUN apk add --no-cache \
    vsftpd \
    lftp \
    openssl


ARG FTP_USER
ARG FTP_PASSWORD


RUN addgroup -g 33 -S www-data || true && \
    adduser -D -h /var/www/wordpress -G www-data $FTP_USER && \
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

RUN mkdir -p /var/www/wordpress && \
    chown -R $FTP_USER:www-data /var/www/wordpress && \
    chmod -R 775 /var/www/wordpress


COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf


EXPOSE 21


CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

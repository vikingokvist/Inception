FROM alpine:3.20

RUN apk add --no-cache \
    vsftpd \
    openssl

RUN adduser -D -h /var/www/wordpress ftpuser && \
    echo "ftpuser:ftp1234" | chpasswd


COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 20 30000-30010

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

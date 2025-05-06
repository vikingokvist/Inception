FROM alpine:3.20


RUN apk add --no-cache \
    coreutils \
    lighttpd


COPY ./tools/whoami.sh /usr/local/bin/whoami.sh
COPY ./conf/lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN chmod +x /usr/local/bin/whoami.sh


EXPOSE 8081


CMD /usr/local/bin/whoami.sh && lighttpd -D -f /etc/lighttpd/lighttpd.conf

FROM alpine:3.20

RUN mkdir -p /tmp/static_files


COPY ./index/ /tmp/static_files/


CMD cp -r /tmp/static_files/* /var/www/static_website/
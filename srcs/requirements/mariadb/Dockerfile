
FROM alpine:3.19


RUN apk update && apk upgrade && apk add --no-cache \
    mariadb mariadb-client bash && \
    rm -rf /var/cache/apk/*


RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld


COPY ./init-db.sh /init-db.sh
RUN chmod +x /init-db.sh


RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql


EXPOSE 3306


CMD ["/bin/bash", "-c", "mysqld_safe --datadir=/var/lib/mysql & sleep 5 && /init-db.sh && tail -f /dev/null"]
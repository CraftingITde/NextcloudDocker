FROM mariadb:10.5.5
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN { \
        echo '[mysqld]'; \
        #Nextcloud Performance
        echo 'innodb_buffer_pool_size=1G'; \
        echo 'innodb_io_capacity=4000'; \
        #MySQL 4-byte support
        echo 'innodb_file_per_table=1'; \
    } > /etc/mysql/conf.d/nextcloud.cnf;


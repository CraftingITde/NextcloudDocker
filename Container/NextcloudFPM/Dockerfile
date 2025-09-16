FROM nextcloud:31.0.9-fpm
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install required packages and performance extensions
RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    libmagickcore-7.q16hdri-10-extra \
    sudo \
    nano \
    procps \
    htop \
    tesseract-ocr \
    tesseract-ocr-deu \
    tesseract-ocr-eng \
    ffmpeg \
    libxml2-utils \
    libldap-common \
    libmemcached-dev \
    libmemcached11 \
    zlib1g-dev \
    libicu-dev \
  && apt upgrade -y \
  && rm -rf /var/lib/apt/lists/* 

# Optimize PHP-FPM settings (based on all-in-one best practices)
RUN { \
        echo '[www]'; \
        echo 'pm = ondemand'; \
        echo 'pm.max_children = 5000'; \
        echo 'pm.process_idle_timeout = 10s'; \
        echo 'pm.max_requests = 1000'; \
        echo 'catch_workers_output = yes'; \
        echo 'clear_env = no'; \
    } > /usr/local/etc/php-fpm.d/zz-performance.conf

# Additional PHP settings optimizations
RUN { \
        echo 'memory_limit = 512M'; \
        echo 'upload_max_filesize = 16G'; \
        echo 'post_max_size = 16G'; \
        echo 'max_input_time = 3600'; \
        echo 'max_execution_time = 3600'; \
        echo 'default_socket_timeout = 3600'; \
        echo 'output_buffering = off'; \
    } > /usr/local/etc/php/conf.d/nextcloud-optimized.ini

# Add OPcache optimizations for better performance
RUN { \
        echo 'opcache.max_accelerated_files=10000'; \
        echo 'opcache.memory_consumption=256'; \
        echo 'opcache.interned_strings_buffer=64'; \
        echo 'opcache.save_comments=1'; \
        echo 'opcache.revalidate_freq=60'; \
        echo 'opcache.jit=1255'; \
        echo 'opcache.jit_buffer_size=8M'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Add APCu optimizations
RUN { \
        echo 'apc.enable_cli=1'; \
        echo 'apc.shm_size=64M'; \
        echo 'apc.serializer=igbinary'; \
    } >> /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

# Session handling via Redis (prepare for Redis configuration)
RUN { \
        echo 'session.save_handler = redis'; \
        echo 'session.save_path = "tcp://${REDIS_HOST}:6379?database=0'; \
        echo 'redis.session.locking_enabled = 1'; \
        echo 'redis.session.lock_retries = -1'; \
        echo 'redis.session.lock_wait_time = 10000'; \
        echo 'session.gc_maxlifetime = 86400'; \
    } > /usr/local/etc/php/conf.d/redis-session.ini

# Add user management script
COPY entrypointModUser.sh /entrypointModUser.sh
RUN chmod +x /entrypointModUser.sh

# Copy Nextcloud configurations
COPY ci.custom.config.php /usr/src/nextcloud/config/ci.custom.config.php
COPY config/preview.config.php /usr/src/nextcloud/config/preview.config.php

ENTRYPOINT ["/bin/bash", "-c", "/entrypointModUser.sh && /entrypoint.sh php-fpm"]
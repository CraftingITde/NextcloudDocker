FROM nextcloud:31.0.8-fpm
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    tesseract-ocr \
    tesseract-ocr-deu \
    tesseract-ocr-eng \
    nano \
    procps \
    htop \
    libmemcached-dev \
    libmemcached11 \
    zlib1g-dev \
    libicu-dev \
  && apt upgrade -y \
  && rm -rf /var/lib/apt/lists/*

# Add the same optimizations as FPM container
RUN { \
        echo 'memory_limit = 512M'; \
        echo 'max_execution_time = 0'; \
        echo 'max_input_time = -1'; \
    } > /usr/local/etc/php/conf.d/nextcloud-cron.ini

# Add OPcache optimizations
RUN { \
        echo 'opcache.max_accelerated_files=10000'; \
        echo 'opcache.memory_consumption=256'; \
        echo 'opcache.interned_strings_buffer=64'; \
        echo 'opcache.save_comments=1'; \
        echo 'opcache.revalidate_freq=60'; \
        echo 'opcache.jit=1255'; \
        echo 'opcache.jit_buffer_size=8M'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini 

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh

COPY ci.custom.config.php /usr/src/nextcloud/config/ci.custom.config.php
COPY config/preview.config.php /usr/src/nextcloud/config/preview.config.php

ENTRYPOINT ["/cron.sh"]

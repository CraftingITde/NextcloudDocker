FROM nextcloud:31.0.8-fpm
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

# Install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    libmagickcore-6.q16-6-extra \
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
  && apt upgrade -y \
  && rm -rf /var/lib/apt/lists/* 

# Optimize PHP-FPM settings
RUN { \
        echo '[www]'; \
        echo 'pm = dynamic'; \
        echo 'pm.max_children = 120'; \
        echo 'pm.start_servers = 12'; \
        echo 'pm.min_spare_servers = 6'; \
        echo 'pm.max_spare_servers = 18'; \
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
        echo 'output_buffering = off'; \
    } > /usr/local/etc/php/conf.d/nextcloud-optimized.ini

# Add user management script
COPY entrypointModUser.sh /entrypointModUser.sh
RUN chmod +x /entrypointModUser.sh

COPY ci.custom.config.php /usr/src/nextcloud/config/ci.custom.config.php

ENTRYPOINT ["/bin/bash", "-c", "/entrypointModUser.sh && /entrypoint.sh php-fpm"]
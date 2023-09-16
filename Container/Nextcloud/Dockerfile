FROM nextcloud:27.1.0-apache 
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN { \
        echo 'pm = dynamic'; \
        echo 'pm.max_children = 120'; \
        echo 'pm.start_servers = 12'; \
        echo 'pm.min_spare_servers = 6'; \
        echo 'pm.max_spare_servers = 18'; \
    } > /usr/local/etc/php/conf.d/pm-recommended.ini; \  
    echo 'memory_limit=1024M' > /usr/local/etc/php/conf.d/memory-limit.ini;

RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    libmagickcore-6.q16-6-extra \
    sudo \
  && rm -rf /var/lib/apt/lists/* 



COPY entrypointModUser.sh /entrypointModUser.sh
RUN chmod +x /entrypointModUser.sh

ENTRYPOINT ["/bin/bash", "-c", "/entrypointModUser.sh && /entrypoint.sh apache2-foreground"]

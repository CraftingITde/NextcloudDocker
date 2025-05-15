FROM nextcloud:31.0.4-apache 
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    libmagickcore-6.q16-6-extra \
    sudo \
    nano \  
  && apt upgrade -y \
  && rm -rf /var/lib/apt/lists/* 

COPY ci.custom.config.php /usr/src/nextcloud/config/ci.custom.config.php

COPY entrypointModUser.sh /entrypointModUser.sh
RUN chmod +x /entrypointModUser.sh

ENTRYPOINT ["/bin/bash", "-c", "/entrypointModUser.sh && /entrypoint.sh apache2-foreground"]

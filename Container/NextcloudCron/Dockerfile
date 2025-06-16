FROM nextcloud:31.0.6-fpm
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    smbclient \
    tesseract-ocr \
    tesseract-ocr-deu \
    tesseract-ocr-eng \
    nano \  
  && apt upgrade -y \
  && rm -rf /var/lib/apt/lists/* 

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh

COPY ci.custom.config.php /usr/src/nextcloud/config/ci.custom.config.php

ENTRYPOINT ["/cron.sh"]

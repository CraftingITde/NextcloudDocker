FROM nextcloud:30.0.3-fpm
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

ENTRYPOINT ["/cron.sh"]

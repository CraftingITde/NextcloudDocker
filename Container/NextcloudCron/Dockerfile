FROM nextcloud:20.0.12-fpm 
LABEL maintainer="Kai Struessmann <kstrusmann@craftingit.de>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    tesseract-ocr \
    tesseract-ocr-deu \
    tesseract-ocr-eng \
  && rm -rf /var/lib/apt/lists/* 

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh

ENTRYPOINT ["/cron.sh"]

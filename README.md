# NextcloudDocker [![Build Status](https://travis-ci.com/CraftingITde/NextcloudDocker.svg?branch=master)](https://travis-ci.com/CraftingITde/NextcloudDocker)

Docker Container Collection for Nextcloud

# Container in this Repository
## Nextcloud
Extends the default configuration with better PHP settings and implements the option to use Samba Share.

```sh
docker pull craftingit/nextcloud:latest
```

## Nextcloud-Cron
Adds [Teseract OCR](https://github.com/tesseract-ocr/tesseract) to be implemented into cron job.

```sh
docker pull craftingit/nextcloudcron:latest
```

### Nextcloud-Elasticsearch
Extended with the [ingest-attachment](https://www.elastic.co/guide/en/elasticsearch/plugins/current/ingest-attachment.html) plugin.

```sh
docker pull craftingit/nextcloud-elasticsearch:latest
```

## Nextcloud-MariaDB
Contains better settings to be used with Nextcloud.

```sh
docker pull craftingit/nextcloud-mariadb:latest
```

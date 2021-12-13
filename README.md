# NextcloudDocker [![Build Status](https://travis-ci.com/CraftingITde/NextcloudDocker.svg?branch=master)](https://travis-ci.com/CraftingITde/NextcloudDocker) ![](https://badgen.net/github/release/craftingitde/NextcloudDocker/stable)


Docker Container Collection for Nextcloud

# Container in this Repository
## Nextcloud [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud) ![](https://badgen.net/docker/pulls/craftingit/nextcloud?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud?icon=docker)
Extends the default configuration with better PHP settings and implements the option to use Samba Share.

```sh
docker pull craftingit/nextcloud:latest
```

__Parameters__:
- `USER_ID` Set the UserID of www-user.
- `GROUP_ID` Set the GroupID of www-user.

## Nextcloud-Cron [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-cron) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-cron?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-cron?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-cron?icon=docker)
Adds [Teseract OCR](https://github.com/tesseract-ocr/tesseract) to be implemented into cron job.

```sh
docker pull craftingit/nextcloudcron:latest
```

__Parameters__:
- `CRON` If set the cron command will run every 15 minutes. 
- `FULLTEXT` If set the Fulltext search index rebuilds every night. 
- `PREVIEW` If set image Previews will be generated every 15 minutes. 
- `USER_ID` Set the UserID of www-user.
- `GROUP_ID` Set the GroupID of www-user.


### Nextcloud-Elasticsearch [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-elasticsearch) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-elasticsearch?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-elasticsearch?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-elasticsearch?icon=docker)
Extended with the [ingest-attachment](https://www.elastic.co/guide/en/elasticsearch/plugins/current/ingest-attachment.html) plugin.

```sh
docker pull craftingit/nextcloud-elasticsearch:latest
```

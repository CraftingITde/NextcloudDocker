# NextcloudDocker [![release-container](https://github.com/CraftingITde/NextcloudDocker/actions/workflows/release-container.yml/badge.svg)](https://github.com/CraftingITde/NextcloudDocker/actions/workflows/release-container.yml)![](https://badgen.net/github/release/craftingitde/NextcloudDocker/stable)


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
- `ADDITIONAL_GROUPS` Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`

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
- `ADDITIONAL_GROUPS` Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`

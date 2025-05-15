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
docker pull craftingit/nextcloud-cron:latest
```

__Parameters__:
- `CRON` If set the cron command will run every 15 minutes. 
- `FULLTEXT` If set the Fulltext search index rebuilds every night. 
- `PREVIEW` If set image Previews will be generated every 15 minutes. 
- `USER_ID` Set the UserID of www-user.
- `GROUP_ID` Set the GroupID of www-user.
- `ADDITIONAL_GROUPS` Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`

## Nextcloud-FPM [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-fpm) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-fpm?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-fpm?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-fpm?icon=docker)
Optimized PHP-FPM container with high-performance settings for Nextcloud.

```sh
docker pull craftingit/nextcloud-fpm:latest
```

__Parameters__:
- `USER_ID` Set the UserID of www-user.
- `GROUP_ID` Set the GroupID of www-user.
- `ADDITIONAL_GROUPS` Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`
- `PHP_MEMORY_LIMIT` Memory limit for PHP (default: 512M)
- `PHP_UPLOAD_LIMIT` Upload file size limit (default: 16G)

## Nextcloud-Nginx [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-nginx) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-nginx?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-nginx?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-nginx?icon=docker)
Nginx web server optimized for Nextcloud with proper caching and security settings.

```sh
docker pull craftingit/nextcloud-nginx:latest
```

## Nextcloud-Notify-Push [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-notify-push) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-notify-push?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-notify-push?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-notify-push?icon=docker)
Lightweight Alpine-based container for Nextcloud's notify_push service, enabling real-time notifications and updates.

```sh
docker pull craftingit/nextcloud-notify-push:latest
```

__Parameters__:
- `NEXTCLOUD_URL` URL of the Nextcloud instance (default: "http://nextcloud:80")
- `NC_DATABASE_URL` Database connection string for Nextcloud
- `NC_REDIS_URL` Redis connection string for Nextcloud
- `LOG_LEVEL` Log verbosity level (default: "info")
- `ALLOW_SELF_SIGNED` Allow self-signed certificates (default: "false")
- `METRICS_PORT` Port for Prometheus metrics (default: "9868")

## Enhanced Stack Features

The enhanced docker-compose stack now includes:

1. **Redis Cache** - Improves performance for file locking and caching
3. **COTURN Server** - For WebRTC signaling with Nextcloud Talk
4. **Notify Push** - Real-time notifications and updates

## Deployment Example

For a complete high-performance deployment:

```bash
# Clone the repository
git clone https://github.com/CraftingITde/NextcloudDocker.git
cd NextcloudDocker/Config

# Start the stack
docker-compose up -d
```
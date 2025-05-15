# NextcloudDocker [![release-container](https://github.com/CraftingITde/NextcloudDocker/actions/workflows/release-container.yml/badge.svg)](https://github.com/CraftingITde/NextcloudDocker/actions/workflows/release-container.yml)![](https://badgen.net/github/release/craftingitde/NextcloudDocker/stable)

Docker Container Collection for Nextcloud

## Container in this Repository

### Nextcloud [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud) ![](https://badgen.net/docker/pulls/craftingit/nextcloud?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud?icon=docker)
Extends the default configuration with better PHP settings and implements the option to use Samba Share.

```sh
docker pull craftingit/nextcloud:latest
```

__Parameters__:
- `USER_ID` - Set the UserID of www-user
- `GROUP_ID` - Set the GroupID of www-user
- `ADDITIONAL_GROUPS` - Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`
- `CI_TRUSTED_DOMAINS` - Space-separated list of trusted domains
- `CI_ALLOW_LOCAL_REMOTE_SERVERS` - Allow local remote servers
- `CI_DATADIRECTORY` - Custom data directory
- `CI_DEFAULTAPP` - Default app to open
- `CI_MAINTENANCE_WINDOW_START` - Maintenance window start time
- `CI_TRASHBIN_RETENTION_OBLIGATION` - Custom trashbin retention settings
- `CI_VERSIONS_RETENTION_OBLIGATION` - Custom file versions retention settings
- `CI_FILELOCKING_ENABLED` - Enable or disable file locking

### Nextcloud-Cron [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-cron) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-cron?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-cron?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-cron?icon=docker)
Adds [Tesseract OCR](https://github.com/tesseract-ocr/tesseract) and scheduled maintenance tasks.

```sh
docker pull craftingit/nextcloud-cron:latest
```

__Parameters__:
- `CRON` - If set to '1', the cron command will run every 5 minutes
- `FULLTEXT` - If set to '1', the fulltext search index rebuilds every night between 23:00-03:00
- `PREVIEW` - If set to '1', image previews will be generated every 5 minutes
- `ONCE` - If set to '1', the container will run once and exit
- `USER_ID` - Set the UserID of www-user
- `GROUP_ID` - Set the GroupID of www-user
- `ADDITIONAL_GROUPS` - Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`
- `CI_TRUSTED_DOMAINS` - Space-separated list of trusted domains
- `CI_ALLOW_LOCAL_REMOTE_SERVERS` - Allow local remote servers
- `CI_DATADIRECTORY` - Custom data directory
- `CI_DEFAULTAPP` - Default app to open
- `CI_MAINTENANCE_WINDOW_START` - Maintenance window start time
- `CI_TRASHBIN_RETENTION_OBLIGATION` - Custom trashbin retention settings
- `CI_VERSIONS_RETENTION_OBLIGATION` - Custom file versions retention settings
- `CI_FILELOCKING_ENABLED` - Enable or disable file locking

### Nextcloud-FPM [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-fpm) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-fpm?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-fpm?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-fpm?icon=docker)
Optimized PHP-FPM container with high-performance settings for Nextcloud. Includes Tesseract OCR, image processing tools, and advanced PHP optimizations.

```sh
docker pull craftingit/nextcloud-fpm:latest
```

__Parameters__:
- `USER_ID` - Set the UserID of www-user
- `GROUP_ID` - Set the GroupID of www-user
- `ADDITIONAL_GROUPS` - Add the user to additional groups. In the format `GROUPID1:GROUPNAME1;GROUPID2:GROUPNAME2`
- `PHP_MEMORY_LIMIT` - Memory limit for PHP (default: 512M)
- `PHP_UPLOAD_LIMIT` - Upload file size limit (default: 16G)
- `CI_TRUSTED_DOMAINS` - Space-separated list of trusted domains
- `CI_ALLOW_LOCAL_REMOTE_SERVERS` - Allow local remote servers
- `CI_DATADIRECTORY` - Custom data directory
- `CI_DEFAULTAPP` - Default app to open
- `CI_MAINTENANCE_WINDOW_START` - Maintenance window start time
- `CI_TRASHBIN_RETENTION_OBLIGATION` - Custom trashbin retention settings
- `CI_VERSIONS_RETENTION_OBLIGATION` - Custom file versions retention settings
- `CI_FILELOCKING_ENABLED` - Enable or disable file locking

### Nextcloud-Nginx [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-nginx) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-nginx?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-nginx?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-nginx?icon=docker)
Nginx web server optimized for Nextcloud with proper caching, security settings, and WebSocket support for real-time notifications.

```sh
docker pull craftingit/nextcloud-nginx:latest
```

Features:
- HTTP/2 bandwidth optimization
- Gzip compression
- Advanced caching policies
- WebSocket proxy for notify_push
- Security headers preconfigured
- Optimized for large file uploads (512MB)
- Built-in healthcheck

### Nextcloud-Notify-Push [![](https://badgen.net/badge/docker/Docker?icon&label=View%20on)](https://hub.docker.com/r/craftingit/nextcloud-notify-push) ![](https://badgen.net/docker/pulls/craftingit/nextcloud-notify-push?icon=docker&label=pulls) ![](https://badgen.net/docker/stars/craftingit/nextcloud-notify-push?icon=docker&label=stars) ![](https://badgen.net/docker/size/craftingit/nextcloud-notify-push?icon=docker)
Lightweight Alpine-based container for Nextcloud's notify_push service, enabling real-time notifications and updates.

```sh
docker pull craftingit/nextcloud-notify-push:latest
```

__Parameters__:
- `NEXTCLOUD_URL` - URL of the Nextcloud instance (default: "http://nextcloud:80")
- `DATABASE_URL` - Database connection string (PostgreSQL format: postgres://user:password@host/dbname)
- `REDIS_URL` - Redis connection string (format: redis://redis:6379?password=secret)
- `LOG_LEVEL` - Log verbosity level (default: "info")
- `ALLOW_SELF_SIGNED` - Allow self-signed certificates (default: "false")

## Stack Components

The complete Nextcloud stack includes:

1. **PostgreSQL Database** - Reliable database backend for Nextcloud
2. **Adminer** - Web-based database management interface
3. **Redis Cache** - High-performance cache for transactional locking and application caching
4. **NGINX Web Server** - Optimized web server with HTTP/2 support
5. **Nextcloud App (FPM)** - PHP-FPM application server
6. **Nextcloud Cron** - Background task scheduler
7. **Notify Push** - Real-time notification service using WebSockets
8. **COTURN Server** - WebRTC signaling for Nextcloud Talk
9. **OnlyOffice** - (Optional) Collaborative document editing

## Environment Variables for Stack Configuration

The stack can be configured using these environment variables:

### Database Configuration
- `POSTGRES_DB` - Database name (default: nextcloud)
- `POSTGRES_USER` - Database user (default: nextcloud)
- `POSTGRES_PASSWORD` - Database password (default: nextcloud)
- `POSTGRES_HOST` - Database host (default: db)

### Redis Configuration
- `REDIS_HOST` - Redis server hostname (default: redis)
- `REDIS_HOST_PASSWORD` - Redis password (default: nextcloud)

### Web Server Configuration
- `TRUSTED_PROXYS` - List of trusted proxies
- `OVERWRITEPROTOCOL` - Protocol to use in URLs (http/https)
- `OVERWRITECLIURL` - URL to use for CLI operations

### PHP Configuration
- `PHP_MEMORY_LIMIT` - PHP memory limit
- `PHP_UPLOAD_LIMIT` - Maximum upload file size

### Nextcloud Configuration
- `CI_TRUSTED_DOMAINS` - List of trusted domains
- `CI_ALLOW_LOCAL_REMOTE_SERVERS` - Allow local servers in remote URLs
- `CI_DATADIRECTORY` - Custom data directory path

### COTURN Configuration
- Preconfigured for Nextcloud Talk with authentication

## Deployment Example

For a complete high-performance deployment:

```bash
# Clone the repository
git clone https://github.com/CraftingITde/NextcloudDocker.git
cd NextcloudDocker/Config

# Start the stack
docker-compose up -d
```

## Automatic Updates

This repository includes GitHub Actions workflows that automatically:

1. Check for new Nextcloud versions weekly
2. Check for new notify_push releases weekly
3. Auto-merge Dependabot updates for Docker images and GitHub Actions

#!/bin/bash

docker tag nextcloud craftingit/nextcloud:dev
docker tag nextcloud-cron craftingit/nextcloud-cron:dev
docker tag nextcloud-mariadb craftingit/nextcloud-mariadb:dev
docker tag nextcloud-elasticsearch craftingit/nextcloud-elasticsearch:dev

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push craftingit/nextcloud
docker push craftingit/nextcloud-cron
docker push craftingit/nextcloud-mariadb
docker push craftingit/nextcloud-elasticsearch
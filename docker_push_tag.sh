#!/bin/bash

docker tag nextcloud craftingit/nextcloud:$TRAVIS_TAG
docker tag nextcloud-cron craftingit/nextcloud-cron:$TRAVIS_TAG
docker tag nextcloud-mariadb craftingit/nextcloud-mariadb:$TRAVIS_TAG
docker tag nextcloud-elasticsearch craftingit/nextcloud-elasticsearch:$TRAVIS_TAG

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push craftingit/nextcloud
docker push craftingit/nextcloud-cron
docker push craftingit/nextcloud-mariadb
docker push craftingit/nextcloud-elasticsearch
#!/bin/bash
if [ ! -z "${USER_ID}" ]; then
    echo User: $USER_ID
    usermod -u $USER_ID www-data
fi

if [ ! -z "${GROUP_ID}" ]; then
    echo Group: $GROUP_ID
    groupmod -g $GROUP_ID www-data
fi


trap "break;exit" SIGHUP SIGINT SIGTERM

run () {
  if ! [ -z ${CRON+x} ]; then
    echo $(date) - Running cron Started
    sudo -u www-data PHP_MEMORY_LIMIT=512M php -f /var/www/html/cron.php
    echo $(date) - Running cron finished
  fi
  #Volltext update
  if ! [ -z ${FULLTEXT+x} ]; then
    currenttime=$(date +%H:%M)
    if [[ "$currenttime" > "23:00" ]] || [[ "$currenttime" < "03:00" ]]; then
      if [ -z ${FULLTEXTRUN+x} ]; then
        echo $(date) - Running fulltextsearch Started
        sudo -u www-data PHP_MEMORY_LIMIT=512M php -f  /var/www/html/occ fulltextsearch:index
        echo $(date) - Running fulltextsearch finished
        FULLTEXTRUN=1
      else
        echo $(date) - Running fulltextsearch skip. Allredy Runned.
      fi
    else 
      unset FULLTEXTRUN
      echo $(date) - Running fulltextsearch skip Wrong Time. 23-03
    fi
  fi
  #Image Previews
  if ! [ -z ${PREVIEW+x} ]; then
    echo $(date) - Running preview:pre-generate Started
    sudo -u www-data PHP_MEMORY_LIMIT=512M php -f /var/www/html/occ preview:pre-generate
    echo $(date) - Running preview:pre-generate finished
  fi
}

if ! [ -z ${ONCE+x} ]; then
  echo $(date) - Running Once
  run
else 
  while /bin/true; do
    sleep 15m
    run
  done
fi
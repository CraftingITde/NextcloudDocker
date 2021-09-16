#!/bin/bash

if [ ! -z "${USER_ID}" ]; then
    echo User: $USER_ID
    usermod -u $USER_ID www-data
fi

if [ ! -z "${GROUP_ID}" ]; then
    echo Group: $GROUP_ID 
    groupmod -g $GROUP_ID www-data
fi

sudo -u www-data /entrypoint.sh apache2-foreground
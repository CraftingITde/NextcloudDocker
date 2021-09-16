#!/bin/bash

if [ ! -z "${GROUP_ID}" ]; then
    echo Group: $GROUP_ID 
    groupmod -o -g $GROUP_ID www-data
fi

if [ ! -z "${USER_ID}" ]; then
    echo User: $USER_ID
    usermod -o -u $USER_ID www-data
fi

/entrypoint.sh apache2-foreground
#!/bin/bash

if [[ $1 == 'up' ]]; then
    source ./sync_folder.sh
    cd $ROOT_DIR/$SYNC_FOLDER
    docker-compose up -d
fi

if [[ $1 == 'down' ]]; then
    docker-compose down
fi
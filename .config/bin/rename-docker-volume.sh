#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: rename-docker-volume.sh <old-volume> <new-volume>"
    
    exit 1
fi

if [[ -z $(docker volume ls -q | grep $1) ]]; then
    echo "Could not find old volume"

    exit 1
fi

#docker volume create --name $2

docker run --rm -it \
    -v $1:/from:ro \
    -v $2:/to alpine \
    ash -c "cd /from ; cp -av . /to"

docker volume rm $1

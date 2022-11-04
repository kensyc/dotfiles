#!/usr/bin/env bash

for container in $(docker container ls -a -q); do
    echo "$(docker inspect -f '{{$name:=.Name}}{{range .Mounts}}{{if eq .Type "volume"}}{{$name}} {{.Name}}:{{.Destination}}{{println}}{{end}}{{end}}' $container)"
done

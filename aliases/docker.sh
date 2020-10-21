#!/usr/bin/env bash

qwe-docker-network-prune () {
    docker network prune -f
}

qwe-docker-remove-all () {
    docker ps --all --quiet | xargs docker rm --force
}

qwe-docker-remove-exited () {
    docker ps --all --filter="status=exited" --quiet | xargs docker rm --force
}

qwe-docker-print-all () {
    docker ps --all ${@:1}
}

qwe-docker-browse-tags () {
    wget -q https://registry.hub.docker.com/v1/repositories/${1}/tags -O - | jq .[].name -r
}

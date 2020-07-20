#!/usr/bin/env bash

qwedrma () {
    docker ps --all --filter="status=exited" --quiet | xargs docker rm --force
}

qwedpsa () {
    docker ps --all ${@:1}
}

qwedbt () {
    wget -q https://registry.hub.docker.com/v1/repositories/${1}/tags -O - | jq .[].name -r
}

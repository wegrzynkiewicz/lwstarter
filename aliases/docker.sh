#!/usr/bin/env bash

qwedrma () {
    docker ps --all --filter="status=exited" --quiet | xargs docker rm --force
}

qwedpsa () {
    docker ps --all ${@:1}
}

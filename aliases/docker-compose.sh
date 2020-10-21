#!/usr/bin/env bash

qwe-docker-compose-down () {
    docker-compose down ${@:1}
}

qwe-docker-compose-up () {
    docker-compose up --build --force-recreate ${@:1}
}

#!/usr/bin/env bash

qwedcd () {
    docker-compose down ${@:1}
}

qwedcup () {
    docker-compose up --build --force-recreate ${@:1}
}

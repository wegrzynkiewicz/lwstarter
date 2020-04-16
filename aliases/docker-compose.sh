#!/usr/bin/env bash

qwedcup () {
    docker-compose up --build --force-recreate ${@:1}
}

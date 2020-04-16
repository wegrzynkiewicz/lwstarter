#!/usr/bin/env bash

qwesd () {
    shutdown -P 0
}

qwexci () {
    xclip -i -selection clipboard ${@:1}
}

qwexco () {
    xclip -o -selection clipboard ${@:1}
}

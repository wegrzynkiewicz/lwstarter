#!/usr/bin/env bash

qwecd () {
    cd "${LW_STARTER_PROJECT_DIR}"
}

qweenv () {
    printenv | grep "LW_STARTER" --color=never ${@:1}
}

qwesd () {
    shutdown -P 0
}

qwexci () {
    xclip -i -selection clipboard ${@:1}
}

qwexco () {
    xclip -o -selection clipboard ${@:1}
}

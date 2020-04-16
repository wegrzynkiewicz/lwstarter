#!/usr/bin/env bash

qweenv () {
    local FILEPATH="${1}"
    grep --perl-regexp '^#' --invert-match "${FILEPATH}" \
        | sed '/^$/d' \
        | sed 's/ *= */=/g' \
        | xargs
}

qwepenv () {
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

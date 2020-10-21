#!/usr/bin/env bash

qwe-env-load-from-file () {
    local FILEPATH="${1}"
    grep --perl-regexp '^#' --invert-match "${FILEPATH}" \
        | sed '/^$/d' \
        | sed 's/ *= */=/g' \
        | xargs
}

qwe-env-print () {
    printenv | grep "LW_STARTER" --color=never ${@:1}
}

qwe-shutdown () {
    shutdown -P 0
}

qwe-xclip-input () {
    xclip -i -selection clipboard ${@:1}
}

qwe-xclip-output () {
    xclip -o -selection clipboard ${@:1}
}

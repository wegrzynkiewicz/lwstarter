#!/usr/bin/env bash

qwe-ssh-keygen() {
    local FILENAME="$(realpath ~/.ssh/keys)/${1}";
    local COMMENT="${2}"
    ssh-keygen -t rsa -b 4096 -f "${FILENAME}" -C "${COMMENT}";
}

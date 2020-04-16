#!/usr/bin/env bash

function touch-file() {

    local FILEPATH=$(realpath "$1");

    if [[ -f "${FILEPATH}" ]]; then
        echo "File (${FILEPATH}) is already exists.";
        return 0;
    else
        echo "Creating (${FILEPATH}) file...";
        touch "${FILEPATH}";
        return 0;
    fi;
}

#!/usr/bin/env bash

function touch-directory() {

    local FILEPATH=$(realpath "$1");

    if [[ -d "${FILEPATH}" ]]; then
        echo "Directory (${FILEPATH}) is already exists.";
        return 0;
    else
        echo "Creating (${FILEPATH}) directory...";
        mkdir "${FILEPATH}";
        return 0;
    fi;
}

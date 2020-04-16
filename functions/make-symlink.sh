#!/usr/bin/env bash

function make-symlink() {

    local TARGET="${1}";
    local FILENAME="${2}";

    if [[ -L "${FILENAME}" ]]; then
        local CURRENT_TARGET="$(readlink --canonicalize "${FILENAME}")";
        if [[ "${CURRENT_TARGET}" == "${TARGET}" ]]; then
            echo "Symlink (${FILENAME}) is already linked."
            exit 2;
        fi;

        echo "Symlink (${FILENAME}) has invalid target (${CURRENT_TARGET})";
        echo "Removing old symlink (${FILENAME})...";
        rm "${FILENAME}";
    fi;

    if [[ -f "${FILENAME}" ]] || [[ -d "${FILENAME}" ]]; then
        echo "Source (${FILENAME}) already exists. Abort.";
        exit 1;
    else
        echo "Creating (${FILENAME}) symlink...";
        ln --symbolic --relative  "${TARGET}" "${FILENAME}"
        exit 0;
    fi;
}

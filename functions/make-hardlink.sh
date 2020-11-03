#!/usr/bin/env bash

function make-hardlink() {

    local TARGET="${1}";
    local FILENAME="${2}";

    if [[ -f "${FILENAME}" ]]; then
        INODES_COUNT=$(stat --printf '%h' "${FILENAME}")
        if [[ "${INODES_COUNT}" -gt "1" ]]; then
            echo "Hardlink (${FILENAME}) is already linked.";
            exit 2;
        fi;
        echo "File (${FILENAME}) is not valid hardlink."
        echo "Removing (${FILENAME}) file...";
        rm "${FILENAME}";
    fi;

    if [[ -f "${FILENAME}" ]] || [[ -d "${FILENAME}" ]]; then
        echo "Source (${FILENAME}) already exists. Abort.";
        exit 1;
    else
        echo "Creating (${FILENAME}) hardlink...";
        ln "${TARGET}" "${FILENAME}"
        exit 0;
    fi;
}

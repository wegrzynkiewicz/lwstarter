#!/usr/bin/env bash

source "./common/bootstrap.sh"

FILENAME="$(realpath ~/.gitignore)";

if [[ -f "${FILENAME}" ]]; then
    INODES_COUNT=$(stat --printf '%h' "${FILENAME}")
    if [[ "${INODES_COUNT}" -gt "1" ]]; then
        echo "Hardlink (${FILENAME}) already linked.";
        exit 2;
    fi;
    echo "File (${FILENAME}) is not valid hardlink."
    echo "Removing (${FILENAME}) file...";
    rm -y "${FILENAME}";
fi;

echo "Creating (${FILENAME}) hardlink...";
ln "./entries/.gitignore" "${FILENAME}";

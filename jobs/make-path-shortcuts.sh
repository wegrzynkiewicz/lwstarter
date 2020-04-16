#!/usr/bin/env bash

source "./common/bootstrap.sh";

touch-directory "${LW_STARTER_CONFIG_DIR}" || exit 1;

FILENAME="${LW_STARTER_CONFIG_DIR}/path-shortcuts";

if [[ -f "${FILENAME}" ]]; then
    echo "File (${FILENAME}) is already exists.";
    exit 2;
else
    echo "Creating (${FILENAME}) file...";
    envsubst < "./templates/path-shortcuts-inset.tpl" > "${FILENAME}";
    exit 0;
fi;

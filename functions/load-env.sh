#!/usr/bin/env bash

function load-env () {

    local ENV_FILE="${LW_STARTER_PROJECT_DIR}/.env";

    if [[ ! -f "${ENV_FILE}" ]]; then
        echo "Environment file does not exists!";
        exit 1;
    fi;

    export $(cat "${ENV_FILE}" | xargs);
}

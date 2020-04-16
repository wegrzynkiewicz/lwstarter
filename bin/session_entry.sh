#!/usr/bin/env bash

export $(cat "${LW_STARTER_PROJECT_DIR}/.env" | xargs)

for ALIAS_FILEPATH in ${LW_STARTER_PROJECT_DIR}/aliases/*.sh; do
    source "${ALIAS_FILEPATH}"
done

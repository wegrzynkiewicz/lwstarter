#!/usr/bin/env bash

for ALIAS_FILEPATH in ${LW_STARTER_PROJECT_DIR}/aliases/*.sh; do
    source "${ALIAS_FILEPATH}"
done

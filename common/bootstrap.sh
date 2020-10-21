#!/usr/bin/env bash

for COMMON_FILEPATH in ${LW_STARTER_PROJECT_DIR}/functions/*.sh; do
    source "${COMMON_FILEPATH}"
done

load-env || exit 1;

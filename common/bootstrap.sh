#!/usr/bin/env bash

for COMMON_FILEPATH in ./functions/*.sh; do
    source "${COMMON_FILEPATH}"
done

load-env || exit 1;

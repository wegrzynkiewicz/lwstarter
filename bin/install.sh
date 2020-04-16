#!/usr/bin/env bash

cd "$(realpath "$(dirname "$0")/..")" || exit 1;

source ./common/bootstrap.sh;

if [[ ! -f "./.env" ]]; then
    echo "Environment file does not exists!";
    exit 1;
fi;

export $(cat "./.env" | xargs);

execute-job "aliases/touch-bash-aliases" && \
execute-job "aliases/append-bash-aliases";

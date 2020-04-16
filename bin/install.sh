#!/usr/bin/env bash

cd "$(realpath "$(dirname "$0")/..")" || exit 1;

source ./common/bootstrap.sh;

if [[ ! -f "./.env" ]]; then
    echo "Environment file does not exists!";
    exit 1;
fi;

export $(cat "./.env" | xargs);

execute-job "touch-bash-aliases" && \
execute-job "append-bash-aliases" && \
execute-job "link-git-ignore"

#!/usr/bin/env bash

cd "$(realpath "$(dirname "$0")/..")" || exit 1;

source ./common/bootstrap.sh;

if [[ ! -f "./.env" ]]; then
    echo "Environment file does not exists!";
    exit 1;
fi;

export $(cat "./.env" | xargs);

for JOB_FILEPATH in ./jobs/*.sh; do
    JOB_NAME="$(basename "${JOB_FILEPATH}" ".sh")"
    execute-job "${JOB_NAME}" || exit 1;
done

#!/usr/bin/env bash

source ./common/bootstrap.sh;

# Execute every jobs
for JOB_FILEPATH in ./jobs/*.sh; do
    JOB_NAME="$(basename "${JOB_FILEPATH}" ".sh")"
    execute-job "${JOB_NAME}" || exit 1;
done

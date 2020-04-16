#!/usr/bin/env bash

function execute-job () {

    local JOB_NAME="${1}"
    local FILEPATH="./jobs/${JOB_NAME}.sh";

    if [[ ! -f "${FILEPATH}" ]]; then
        echo "Task named (${JOB_NAME}) not exists... Abort.";
        return1;
    fi;

    echo "${JOB_NAME}: ";
    "${FILEPATH}" | sed "s/^/  /"

    EXIT_CODE="${PIPESTATUS[0]}";

    if [[ ${EXIT_CODE} -eq "1" ]]; then
        return 1;
    fi;

    echo '';
}

#!/usr/bin/env bash

source "./common/bootstrap.sh"

FILENAME="$(realpath ~/.bash_aliases)";

touch-file "${FILENAME}" || exit 2;
grep "lwstarter" "${FILENAME}" > /dev/null;
EXIT_CODE="${?}"

if [[ "${EXIT_CODE}" -eq "0" ]]; then
    echo "File (${FILENAME}) contain valid bootstrap line.";
    exit 2;
else
    echo "Appending bootstrap source line to (${FILENAME})...";
    envsubst < "./templates/bash-aliases-inset.tpl" >> "${FILENAME}";
    exit 0;
fi;

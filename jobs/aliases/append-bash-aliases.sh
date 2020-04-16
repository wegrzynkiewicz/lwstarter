#!/usr/bin/env bash

FILENAME="$(realpath ~/.bash_aliases)";
grep "LW_STARTER_INSTALLED" "${FILENAME}" > /dev/null;
EXIT_CODE="${?}"

if [[ "${EXIT_CODE}" -eq "0" ]]; then
    echo "File (${FILENAME}) contain valid bootstrap line.";
    exit 2;
else
    echo "Append bootstrap source line to (${FILENAME})...";
    envsubst < "./templates/bash-aliases-inset.tpl" >> "${FILENAME}";
    exit 0;
fi;

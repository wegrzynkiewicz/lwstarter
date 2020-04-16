#!/usr/bin/env bash

for ALIAS_FILEPATH in ${LW_STARTER_PROJECT_DIR}/aliases/*.sh; do
    source "${ALIAS_FILEPATH}"
done

CUSTOM_ALIASES_FILEPATH="${LW_STARTER_CONFIG_DIR}/custom-aliases.sh";
if [[ -f "${CUSTOM_ALIASES_FILEPATH}" ]]; then
    source "${CUSTOM_ALIASES_FILEPATH}";
fi;

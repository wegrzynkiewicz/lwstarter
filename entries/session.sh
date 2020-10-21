#!/usr/bin/env bash

LW_STARTER_PROJECT_DIR="${1}";

# Load helpful functions
source "${LW_STARTER_PROJECT_DIR}/common/bootstrap.sh"

# Load all aliases in project
for ALIAS_FILEPATH in ${LW_STARTER_PROJECT_DIR}/aliases/*.sh; do
    source "${ALIAS_FILEPATH}"
done

# Load custom aliases from config dir
CUSTOM_ALIASES_FILEPATH="${LW_STARTER_CONFIG_DIR}/custom-aliases.sh";
if [[ -f "${CUSTOM_ALIASES_FILEPATH}" ]]; then
    source "${CUSTOM_ALIASES_FILEPATH}";
fi;

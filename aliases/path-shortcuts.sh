#!/usr/bin/env bash

qwecd () {
    local TARGET_NAME="${1}";
    if [[ ! "${TARGET_NAME}" ]]; then
        cd "${LW_STARTER_PROJECT_DIR}"
        return 0;
    fi;

    local PATH_SHORTCUTS_FILENAME="${LW_STARTER_CONFIG_DIR}/path-shortcuts";
    if [[ ! -f "${PATH_SHORTCUTS_FILENAME}" ]]; then
        echo "Cannot find file with shortcuts.";
    fi;

    local RESULT=$(grep --perl-regexp "^${TARGET_NAME}:" "${PATH_SHORTCUTS_FILENAME}");

    local LINE_COUNT=$(echo ${RESULT} | wc -l);

    if [[ "${LINE_COUNT}" -gt 1 ]]; then
        echo "Found shortcuts are ambiguous... Abort.";
        echo ${RESULT};
        return 1;
    fi;

    if [[ ! "${LINE_COUNT}" -eq 1 ]]; then
        echo "Not found shortcut... Abort.";
        return 1;
    fi;

    local PATH=$(echo ${RESULT} | cut --delimiter ":" --fields 2);
    eval "cd ${PATH}";
}


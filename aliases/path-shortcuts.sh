#!/usr/bin/env bash

qwepstcd () {

    local TARGET_NAME="${1}";
    if [[ ! "${TARGET_NAME}" ]]; then
        cd ~
        return 0;
    fi;

    local PATH_SHORTCUTS_FILENAME="${LW_STARTER_CONFIG_DIR}/path-shortcuts";
    if [[ ! -f "${PATH_SHORTCUTS_FILENAME}" ]]; then
        echo "Cannot find file with shortcuts.";
        return 1;
    fi;

    local RESULT=$(grep --perl-regexp "^${TARGET_NAME}:" "${PATH_SHORTCUTS_FILENAME}");

    if [[ -z "${RESULT}" ]]; then
        echo "Not found shortcut... Abort.";
        return 1;
    else
        local LINE_COUNT=$(wc -l <<< "${RESULT}");
        if [[ "${LINE_COUNT}" -gt 1 ]]; then
            echo "Found shortcuts are ambiguous... Abort.";
            echo ${RESULT};
            return 1;
        fi;
    fi;

    local PATH=$(cut --delimiter ":" --fields 2 <<< "${RESULT}");
    cd "${PATH}";
}

qwepsta() {

    local TARGET_NAME="${1}";
    if [[ ! "${TARGET_NAME}" ]]; then
        echo "No passed shortcut name... Abort.";
        return 1;
    fi;

    local PATH_SHORTCUTS_FILENAME="${LW_STARTER_CONFIG_DIR}/path-shortcuts";
    if [[ ! -f "${PATH_SHORTCUTS_FILENAME}" ]]; then
        echo "Cannot find file with shortcuts.";
        return 1;
    fi;

    local PATH=$(pwd);
    local LINE="${TARGET_NAME}:${PATH}";

    echo "${LINE}" >> "${PATH_SHORTCUTS_FILENAME}";
    echo "Saved shortcut as (${PATH})";
}

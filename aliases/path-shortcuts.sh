#!/usr/bin/env bash

qwe-shortcuts-change-directory () {

    local TARGET_NAME="${1}";
    if [[ ! "${TARGET_NAME}" ]]; then
        cd ~
        return 0;
    fi;

    if [[ ! -f "${LW_STARTER_SHORTCUTS_FILE}" ]]; then
        echo "Cannot find file with shortcuts.";
        return 1;
    fi;

    local RESULT=$(grep --perl-regexp "^${TARGET_NAME}:" "${LW_STARTER_SHORTCUTS_FILE}");

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

qwe-shortcuts-add-directory() {

    local TARGET_NAME="${1}";
    if [[ ! "${TARGET_NAME}" ]]; then
        echo "No passed shortcut name... Abort.";
        return 1;
    fi;

    if [[ ! -f "${LW_STARTER_SHORTCUTS_FILE}" ]]; then
        echo "Cannot find file with shortcuts.";
        return 1;
    fi;

    local PATH=$(pwd);
    local LINE="${TARGET_NAME}:${PATH}";

    echo "${LINE}" >> "${LW_STARTER_SHORTCUTS_FILE}";
    echo "Saved shortcut (${TARGET_NAME}) as (${PATH})";
}

qwe-shortcuts-edit() {
    vim "${LW_STARTER_SHORTCUTS_FILE}"
}

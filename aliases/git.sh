#!/usr/bin/env bash

qwe-git-push-fast() {
    git add . && git commit -m "Development" && git push origin master;
}

qwe-git-push-slow() {
    local BRANCH="${1}"
    local MESSAGE="${2}"
    git add . && git commit -m "${MESSAGE}" && git push origin "${BRANCH}";
}

qwe-git-push-amend() {
    local BRANCH="${1}"
    local MESSAGE="${2}"
    git add . && git commit -m --amend "${MESSAGE}" && git push origin "${BRANCH}" -f;
}

qwe-git-config-user() {
    local EMAIL="${1}";
    git config --local --replace-all user.name "${LW_STARTER_USER_FIRSTNAME} ${LW_STARTER_USER_SURNAME}"
    git config --local --replace-all user.email "${EMAIL}"
}
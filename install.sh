#!/usr/bin/env bash

REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${REPO_PATH}/common.sh"

function append-lws-entry() {
  local FILENAME="$(realpath ~/.bash_aliases)"
  touch "${FILENAME}" || exit 2
  grep "lws" "${FILENAME}" >/dev/null
  local EXIT_CODE="${?}"

  if [[ "${EXIT_CODE}" -eq "0" ]]; then
    echo "File (${FILENAME}) contain valid bootstrap line."
  else
    echo "Appending bootstrap source line to (${FILENAME})..."
    echo "source ${REPO_PATH}/lws-entry.sh" >>"${FILENAME}"
  fi
}
append-lws-entry

function link-git-config() {
  local TARGET="$(realpath --no-symlinks ${REPO_PATH}/data/.gitconfig)"
  local FILENAME="$(realpath --no-symlinks ~/.gitconfig)"
  make-symlink ${TARGET} ${FILENAME}
}
link-git-config

function link-git-ignore() {
  local TARGET="$(realpath --no-symlinks ${REPO_PATH}/data/.gitignore)"
  local FILENAME="$(realpath --no-symlinks ~/.gitignore)"
  make-symlink ${TARGET} ${FILENAME}
}
link-git-ignore

function make-dirs() {
  touch-directory ~/.ssh/keys
  touch-directory ~/repos
  touch-directory ~/passwords
}
make-dirs

#!/usr/bin/env bash

function load-env() {
  # Load environment variables from .env file
  local ENV_FILE="${REPO_PATH}/data/.env"
  if [[ ! -f "${ENV_FILE}" ]]; then
    echo "Environment file does not exists!"
    exit 1
  fi
  export $(cat "${ENV_FILE}" | xargs)
}

function make-symlink() {
  # Create a symlink if it does not exists
  local TARGET="${1}"
  local FILENAME="${2}"
  if [[ -L "${FILENAME}" ]]; then
    local CURRENT_TARGET="$(readlink --canonicalize "${FILENAME}")"
    if [[ "${CURRENT_TARGET}" == "${TARGET}" ]]; then
      echo "Symlink (${FILENAME}) is already linked."
      return 2
    fi
    echo "Symlink (${FILENAME}) has invalid target (${CURRENT_TARGET})"
    echo "Removing old symlink (${FILENAME})..."
    rm "${FILENAME}"
  fi
  echo "Creating (${FILENAME}) symlink..."
  ln --symbolic --relative "${TARGET}" "${FILENAME}"
}

function touch-directory() {
  # Create a directory if it does not exists
  local FILEPATH=$(realpath "$1")
  if [[ -d "${FILEPATH}" ]]; then
    echo "Directory (${FILEPATH}) is already exists."
    return 0
  else
    echo "Creating (${FILEPATH}) directory..."
    mkdir "${FILEPATH}"
    return 0
  fi
}

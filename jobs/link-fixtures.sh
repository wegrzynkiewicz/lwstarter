#!/usr/bin/env bash

source "./common/bootstrap.sh"

TARGET="${LW_STARTER_PROJECT_DIR}/entries/fixtures";
FILENAME="$(realpath --no-symlinks ~/fixtures)";

make-symlink "${TARGET}" "${FILENAME}"

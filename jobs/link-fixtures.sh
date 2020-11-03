#!/usr/bin/env bash

source "./common/bootstrap.sh"

TARGET="$(realpath --no-symlinks ./entries/fixtures)";
FILENAME="$(realpath --no-symlinks ~/fixtures)";

make-symlink "${TARGET}" "${FILENAME}"

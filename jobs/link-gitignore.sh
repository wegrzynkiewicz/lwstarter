#!/usr/bin/env bash

source "./common/bootstrap.sh"

TARGET="$(realpath --no-symlinks ./entries/.gitignore)";
FILENAME="$(realpath --no-symlinks ~/.gitignore)";

make-symlink ${TARGET} ${FILENAME}

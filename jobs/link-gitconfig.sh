#!/usr/bin/env bash

source "./common/bootstrap.sh"

TARGET="$(realpath --no-symlinks ./entries/.gitconfig)";
FILENAME="$(realpath --no-symlinks ~/.gitconfig)";

make-symlink ${TARGET} ${FILENAME}

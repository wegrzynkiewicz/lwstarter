#!/usr/bin/env bash

CURRENT_DIR="$(dirname $0)"
PROJECT_DIR="$(realpath "$(dirname "$0")/../..")"

source "${PROJECT_DIR}/common/bootstrap.sh";

touch-file $(realpath ~/.bash_aliases) || exit 0;

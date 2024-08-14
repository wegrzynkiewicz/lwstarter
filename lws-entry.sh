#!/usr/bin/env bash

REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${REPO_PATH}/common.sh"
load-env
source "${REPO_PATH}/data/aliases.sh"

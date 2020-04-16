#!/usr/bin/env bash

source "./common/bootstrap.sh";

touch-file $(realpath ~/.bash_aliases) || exit 2;

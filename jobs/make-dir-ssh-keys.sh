#!/usr/bin/env bash

source "./common/bootstrap.sh";

touch-directory ~/.ssh/keys || exit 1;

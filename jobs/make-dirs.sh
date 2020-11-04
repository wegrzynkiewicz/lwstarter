#!/usr/bin/env bash

source "./common/bootstrap.sh";

touch-directory ~/.ssh/keys || exit 1;

touch-directory ~/repos || exit 1;
touch-directory ~/repos/bitbucket.org || exit 1;
touch-directory ~/repos/github.com || exit 1;
touch-directory ~/repos/localhost || exit 1;

touch-directory ~/passwords || exit 1;

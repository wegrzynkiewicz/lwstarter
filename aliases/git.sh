#!/usr/bin/env bash

qwegaa() {
    git add . ${@:1}
}

qwegla() {
    git log \
        --pretty=format:'%C(green)%h %C(reset)-%C(auto)%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
        --abbrev-commit \
        --graph \
        --color \
        --date-order \
        --all \
         ${@:1}
}

qweglg() {
    git log \
        --pretty=format:'%C(green)%h %C(reset)-%C(auto)%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
        --abbrev-commit \
        --graph \
        --color \
        --date-order \
        --all \
        -20 \
        ${@:1}
}

qweglo() {
    git log \
        --pretty=format:'%C(green)%h %C(reset)-%C(auto)%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
        --abbrev-commit \
        --graph \
        --color \
        --date-order \
        ${@:1}
}

qwegrc() {
    git rebase --continue ${@:1}
}


qwegs() {
    git status ${@:1}
}

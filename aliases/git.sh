#!/usr/bin/env bash

qwe-git-add-all() {
    git add . ${@:1}
}

qwe-git-log-all() {
    git log \
        --pretty=format:'%C(green)%h %C(reset)-%C(auto)%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
        --abbrev-commit \
        --graph \
        --color \
        --date-order \
        --all \
         ${@:1}
}

qwe-git-log-global() {
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

qwe-git-log-only() {
    git log \
        --pretty=format:'%C(green)%h %C(reset)-%C(auto)%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
        --abbrev-commit \
        --graph \
        --color \
        --date-order \
        ${@:1}
}

qwe-git-push() {
    git add . && git commit -m "Development" && git push origin master;
}

qwe-git-rebase-continue() {
    git rebase --continue ${@:1}
}

qwe-git-status() {
    git status ${@:1}
}

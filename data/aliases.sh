#!/usr/bin/env bash

qwe-env() {
  # Load environment variables from file
  local FILEPATH="${1:-.env}"
  grep --perl-regexp '^#' --invert-match "${FILEPATH}" |
    sed '/^$/d' |
    sed 's/ *= */=/g' |
    xargs
}

qwe-shutdown() {
  # Shutdown the system immediately
  shutdown -P 0
}
alias qwe-sd="qwe-shutdown"

qwe-xclip-input() {
  # Copy input to clipboard
  xclip -i -selection clipboard ${@:1}
}
alias qwe-xci="qwe-xclip-input"

qwe-xclip-output() {
  # Paste clipboard content
  xclip -o -selection clipboard ${@:1}
}
alias qwe-xco="qwe-xclip-output"

qwe-ls-listen() {
  # List all listening ports
  sudo lsof -i -P -n | grep LISTEN
}

qwe-docker-compose-up() {
  # Start docker-compose services
  docker-compose up --build --force-recreate ${@:1}
}
alias qwe-dcu="qwe-docker-compose-up"

qwe-docker-remove-all() {
  # Remove all docker containers
  docker ps --all --quiet | xargs docker rm --force
}

qwe-docker-remove-exited() {
  # Remove all exited docker containers
  docker ps --all --filter="status=exited" --quiet | xargs docker rm --force
}

qwe-docker-browse-tags() {
  # Browse all tags of a docker image
  wget -q https://hub.docker.com/v2/repositories/library/${1}/tags?page_size=100 -O - | jq .results[].name -r
}

qwe-docker-network-gateway-address() {
  # Get gateway address of a docker network
  local NETWORK=$1
  docker network inspect "${NETWORK}" --format='{{( index .IPAM.Config 0).Gateway}}'
}

qwe-git-push-fast() {
  # Push changes to remote repository
  git add . && git commit -m "Development" && git push origin master
}

qwe-git-config-user() {
  # Configure git user
  local EMAIL="${1}"
  git config --local --replace-all user.name "${LWS_USER_FIRSTNAME} ${LWS_USER_SURNAME}"
  git config --local --replace-all user.email "${EMAIL}"
}

qwe-ssh-keygen() {
  # Generate SSH key pair
  local FILENAME="$(realpath ~/.ssh/keys)/${1}"
  local COMMENT="${2}"
  ssh-keygen -t rsa -b 4096 -f "${FILENAME}" -C "${COMMENT}"
}

qwe-rclone-gdrive() {
  # Sync Google Drive with local directory
  /usr/bin/rclone \
    copy \
    --update \
    --verbose \
    --transfers 30 \
    --checkers 8 \
    --contimeout 60s \
    --timeout 300s \
    --retries 3 \
    --low-level-retries 10 \
    --stats 1s \
    --drive-acknowledge-abuse \
    "gdrive:/" \
    "/home/lukasz/gdrive"
}

qwe-rclone-ovh() {
  # Push local directory to OVH Object Storage
  rclone \
    copy \
    --update \
    --verbose \
    ~/gdrive/ \
    s3:/gdrive-backups
}

#!/usr/bin/env bash

qwe-kubernetes-get-pods() {
    kubectl get pods
}

qwe-gcloud-set-project() {
    gcloud config set project ${1}
    gcloud container clusters get-credentials ${2}
}

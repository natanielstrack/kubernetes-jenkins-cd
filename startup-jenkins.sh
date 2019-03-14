#!/usr/bin/env bash

helm init --client-only

tiller --storage=secret &
TILLER_PID=$!

helm del --purge cd
helm install -n cd stable/jenkins -f jenkins/values.yaml --version 0.16.6 --wait  --namespace cd-jenkins

kill $TILLER_PID

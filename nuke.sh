#!/usr/bin/env bash

read -p $'ATTENTION: This will delete the cluster and all resources.
Are you sure (Y/n)? ' -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Y]$  ]]
then
tiller --storage=secret &
    TILLER_PID=$!

    helm delete cd

    kill $TILLER_PID

    gcloud container clusters delete live
    echo boom
fi

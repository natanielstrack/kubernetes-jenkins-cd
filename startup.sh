#!/usr/bin/env bash

gcloud container clusters create live --machine-type=n1-standard-2

gcloud container clusters get-credentials live

kubectl create -f ./cd-jenkins-namespace.yaml

#gcloud container clusters get-credentials live --zone us-central1-a --project <project_id>  && kubectl exec <pod_id> -c cd-jenkins -it -- /bin/bash

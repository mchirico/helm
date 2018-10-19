#!/bin/bash

# Make your changes here
export EMAIL=mchirico@gmail.com

kubectl delete secret myregistrykey
kubectl create secret docker-registry myregistrykey --docker-server=https://us.gcr.io --docker-username=oauth2accesstoken --docker-password="$(gcloud auth print-access-token)" --docker-email=${EMAIL}
kubectl get secret myregistrykey



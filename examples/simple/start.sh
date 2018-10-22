#!/bin/bash
gcloud container clusters create concourse --image-type ubuntu     --scopes cloud-source-repos-ro,storage-full

kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default concourse-admin
helm init --service-account=tiller
helm repo update

export PROJECT=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT-helm-repo
helm plugin install https://github.com/viglesiasce/helm-gcs.git --version v0.1.1
gsutil mb -l us-central1 gs://$BUCKET
helm gcs init gs://$BUCKET


# Install

# helm install --dry-run --debug ./nginx
helm install --debug ./nginx


# Now
kubectl port-forward service/looming-iguana-nginx 8888:8888

# Edit
kubectl edit deployments/looming-iguana-nginx

# Example Delete
#   Napoleon:simple mchirico$ helm ls --short
#      looming-iguana
#   Napoleon:simple mchirico$ helm delete looming-iguana
#      release "looming-iguana" deleted




#!/bin/bash
gcloud container clusters create pulsar-gke-cluster \
  --zone=us-central1-a \
  --machine-type=n1-standard-2 \
  --num-nodes=3 \
  --local-ssd-count=2

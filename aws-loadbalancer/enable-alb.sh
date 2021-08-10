#!/bin/bash


kubectl apply -f aws-load-balancer-controller-service-account.yaml

kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.1.1/cert-manager.yaml


curl -o v2_2_0_full.yaml https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/v2_2_0_full.yaml

kubectl apply -f v2_2_0_full.yaml

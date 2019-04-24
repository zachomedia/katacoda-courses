#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Setup OPA Gatekeeper - Policy Controller for Kubernetes
kubectl create ns gatekeeper-system
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper-constraint.yaml

{ clear && echo 'Kubernetes with OPA is ready.'; } 2> /dev/null

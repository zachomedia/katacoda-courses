#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

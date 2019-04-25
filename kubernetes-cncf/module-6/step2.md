## Install Istio ##

`curl -L https://github.com/knative/serving/releases/download/v0.5.1/istio-lean.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace istio-system`{{execute}}

Request Istio to inject its Envoy sidecars into applications deployed to the _default_ namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

Notice Istio adds extensions (CRD's) to the Kubernetes API.

`kubectl get crds | grep .istio.`{{execute}}

> Note: `istio-lean.yaml` Installs only Istio and disables the Service Mesh by default since this is only for testing purposes.

## Installing Knative Serving ##

`curl -L https://github.com/knative/serving/releases/download/v0.5.1/serving.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace knative-serving`{{execute}}

Notice Knative adds extensions (crds) to the Kubernetes API.

`kubectl get crds | grep .knative.`{{execute}}

Now that KNative is up and running, the next step is to deploy an application.

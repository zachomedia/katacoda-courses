As you see, your Kubernetes cluster is started. Verify it's ready for your use.

`kubectl version && kubectl cluster-info && kubectl get nodes`{{execute}}

Verify the Kubernetes cluster is empty.

`kubectl get deployments,pods,services`{{execute}}

The [Helm](https://helm.sh/) package manager used for installing applications on Kubernetes is also available.

`helm version`{{execute}}

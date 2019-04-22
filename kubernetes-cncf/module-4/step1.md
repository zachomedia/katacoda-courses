As you see, your Kubernetes cluster is started. Verify it's ready for your use.

`kubectl version && kubectl cluster-info && kubectl get nodes`{{execute}}

Verify the Kubernetes cluster is empty.

`kubectl get deployments,pods,services`{{execute}}

The [Helm](https://helm.sh/) package manager used for installing applications on Kubernetes is also available.

`helm version`{{execute}}

The Kubernetes dashboard is also available, but you will need the secret access token to login. reveal the token

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

then paste this the token into the login prompt.

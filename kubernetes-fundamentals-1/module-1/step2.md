With a running Kubernetes cluster, containers can now be deployed.

Generally we would deploy these using Deployment YAML files, but for this
example, we will use the command line.

The `kubectl run` command allows containers to be deployed onto the cluster.

`kubectl run first-deployment --image=katacoda/docker-http-server --port=80`{{execute}}

The status of the deployment can be discovered via viewing the running Pods.

`kubectl get pods`{{execute}}

There are many ways to access the pod from outside the cluster. We can use
`NodePort` to expose a running pod via a dynamically assigned port on the
Kubernetes node.

`kubectl expose deployment first-deployment --port=80 --type=NodePort`{{execute}}

> *How does this work?* This will create an `iptables` (Linux firewall) entry to redirect
  incomming traffic on that port to the pod.

The command below finds the allocated port and performs a HTTP request.

`export PORT=$(kubectl get svc first-deployment -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
echo "Accessing master:$PORT"
curl master:$PORT`{{execute}}

The results is the container that processed the request.

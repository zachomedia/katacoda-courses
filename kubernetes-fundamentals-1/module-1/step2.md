With a running Kubernetes cluster, containers can now be deployed.

Generally we would deploy these using Deployment YAML files, but for this
example, we will use the command line.

The `kubectl run` command allows containers to be deployed onto the cluster.

`kubectl run first-deployment --image=katacoda/docker-http-server --port=80`{{execute}}

The status of the deployment can be discovered via viewing the running Pods.

`kubectl get pods`{{execute}}

Once the container is running, it can be exposed via different networking
options, depending on requirements. One possible solution is NodePort, that
provides a dynamic port on the host to a container. What this command does is
create iptables rules to route traffic that hits a specific port on the host to
the container that we deployed.

`kubectl expose deployment first-deployment --port=80 --type=NodePort`{{execute}}

The command below finds the allocated port and executes a HTTP request.

`export PORT=$(kubectl get svc first-deployment -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
echo "Accessing master:$PORT"
curl master:$PORT`{{execute}}

The results is the container that processed the request.

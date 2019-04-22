Right now, we have a Kubernetes cluster running.

The cluster can be interacted with using the kubectl CLI. This is the primary approach for managing Kubernetes and the applications running on top of the cluster.

1) Retrieve information about our cluster:

`kubectl cluster-info`{{execute}}

2) To view the nodes in the cluster:

`kubectl get nodes`{{execute}}

> Note: If the node is marked as NotReady then it is still starting the components.

3) Show the kubernetes system pods running:

`watch -n .5 kubectl get pods -n kube-system`{{execute}}

> Note: Once all pods show as "running" you can proceed to the next step. Hit *"CTRL+C"* to exit the watch.

4) We can see the other host in our cluster, and actually SSH to it:

`ssh node01`{{execute}}

However, we will be managing our Kubernetes cluster from the master, so exit
the SSH connection by typing `exit`.

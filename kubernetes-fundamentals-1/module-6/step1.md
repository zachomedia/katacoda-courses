Kubectl is the primary way that we will interact with a Kubernetes cluster. It can be used to both query and modify Kubernetes objects.

For example, we can get information about our cluster's nodes:

`kubectl get nodes`{{execute}}

Here's information about our cluster:

`kubectl cluster-info`{{execute}}

We'll usually start by creating an object:

`kubectl create -f <file.yaml>`

Once an object is created, we can always update it later:

`kubectl apply -f <file.yaml>`

Let's run a simple hello-world Deployment:

`kubectl create -f ./resources/nginx-deployment.yaml`{{execute}}

Now that we have a running application, we can examine it with `kubectl get`:

`kubectl get deployments`{{execute}}

`kubectl get pods`{{execute}}

We can even go down a level below, and directly query Docker:

`docker container ls -a`{{execute}}

We can get more information about a resource with `kubectl describe`.

`kubectl describe deployment nginx-deployment`{{execute}}

We can also debug our Deployments by checking logs from individual pods:

`kubectl logs nginx-deployment-<deployment-id>-<container-id>`

This is similar to performing a `docker logs <container name>`.

There is also a shorthand for using `kubectl get`, namely Pods = po, ReplicaSets = rs, Deployments = deploy, Service = svc

When we want to delete a resource, we use `kubectl delete`:

`kubectl delete -f <object.yaml>`

`kubectl delete pods, deployments -l app=wordpress`

`kubectl delete pods|deployments|services --all`

`kubectl delete pods|deployments|services <name>`

`kubectl delete deployment nginx-deployment`{{execute}}

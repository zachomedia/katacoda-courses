The first thing we will need to do is deploy a Ingress Controller.

An ingress is an API object that manages external access to the services in a cluster, typically HTTP.

Ingress can provide load balancing, SSL termination and name-based virtual hosting.

Let's deploy our Ingress Controller:

`kubectl create -f ./resources/base.yaml`{{execute}}
ConfigMaps are Kubernetes objects that store configuration external to source code.

Creating a ConfigMap is easy:

`kubectl create configmap <configmap-name> <data>`

The `<data>` used to populate the ConfigMap can be from a variety of different formats. For testing purposes, the easiest way to supply this is with *literals*.

Literals refers to data you enter in on the command line.

For example:

`kubectl create configmap my-config --from-literal=course="Kubernetes Fundamentals"`{{execute}}

Now that the ConfigMap is created we can view it with:

`kubectl get configmaps`{{execute}}

We can inspect the contents with:

`kubectl describe configmap my-config`{{execute}}

We can get an even better view with:

`kubectl get configmap my-config -o yaml`{{execute}}

You can also provide multiple values to a ConfigMap:

`kubectl create configmap multi-config --from-literal=name.first=David --from-literal=name.last=Widen --from-literal=age=28 --from-literal=hometown="Glen Cove"`{{execute}}

And get an even better view with:

`kubectl get configmap multi-config -o yaml`{{execute}}

You can also create a ConfigMap from a directory. This is very similar to creating them from files. It can be very useful, as it allows you to separate out configuration into multiple directories, and then you can create an individual ConfigMp for each directory, and then quickly swap out configuration.

First, let's clear out our ConfigMaps:

`kubectl delete configmap my-config`{{execute}}

`kubectl delete configmap multi-config`{{execute}}

`kubectl delete configmap game-config`{{execute}}

`kubectl delete configmap person-config`{{execute}}

Now that we cleared out all of our old ConfigMaps, lets create a new one from a directory.

`kubectl create configmap dir-config --from-file=configs`{{execute}}

At this point, Kubernetes will create a ConfigMap and populate it with all of the configuration from all files in the directory.

We can see it pulled in both sets of configuration:

`kubectl describe configmap dir-config`{{execute}}

And, view the ConfigMap:

`kubectl get configmap dir-config -o yaml`{{execute}}

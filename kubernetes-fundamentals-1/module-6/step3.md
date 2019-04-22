Pods are the smallest individual compute unit in the Kubernetes system. Pods are a group of 1 or more containers that share an IP address, and communicate over localhost. They are designed to resemble the notion of a single host in a non-containerized environment.

Pods allow you to configure all aspects of the underlying Docker containers.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: alpine-pod
  labels:
    app: hello-world
spec:
  containers:
  - name: alpine
    image: alpine
    command: ['sh', '-c', 'echo Hello World!']
```

This is a simple manifest file that provides the specification for a Pod. In this instance, we are creating a Pod called `alpine-pod`. It has a label `app=hello-world`. It has a single container, which is named `alpine`. This container runs the latest version of the alpine Docker images, and outputs `Hello World!` to the CLI.

To create our Pod, we can execute:

`kubectl create -f ./resources/alpine.yaml`{{execute}}

To view the `Hello World` message, we need to view the logs (since the message was written to STDOUT):

`kubectl logs alpine-pod alpine`{{execute}}

Finally, to destroy our Pod, we can execute:

`kubectl delete pod alpine-pod`{{execute}}

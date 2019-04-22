It is important to note that Deployments leverage and automatically create "ReplicaSets" and use these to automatically restart pods if they crash as well an maintain the desired number of pods.

More about ReplicaSets and Deployments:

Deployments: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
ReplicaSets: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/

Replicasets can be managed outside of deployments, but that is outside the scope of this training.

There are 3 basic types of deployments. `Deployment`, `DaemonSet` and `StatefulSet`.

In this next step, we will show standard Deployment file written in YAML and how we can interact with this deployment.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: http-deployment
  labels:
    app: http
spec:
  replicas: 2
  selector:
    matchLabels:
      app: http
  template:
    metadata:
      labels:
        app: http
    spec:
      containers:
      - name: http
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

This is a basic Deployment file and that includes the additional instructions to run a ReplicaSet of 2 pods.

Let's deploy this pod from the pre-created manifest file and then see all of the components that were created.

`kubectl apply -f ./resources/http-deployment.yaml`{{execute}}

`kubectl get pods,deploy,rs`{{execute}}

Notice that 2 pods, a deployment and a replicaset were all created from that one manifest file.

Before we move on, lets query the pods to see that they are different.

Run `kubectl get pods -o wide`{{execute}} and copy the pod IP for each and run a curl. Notice that the pods return different IDs inside tutum. This will come in handy in Module 5 when we discuss services.

`curl POD_IP` (you will need to manually enter this command with you Pod IPs)

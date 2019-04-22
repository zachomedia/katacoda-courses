
Now lets run the similar pods, but this time, we will use a DaemonSet.

The DaemonSet differs from a basic Deployment because it will only run 1 Pod on each host. No more, no less. More about DaemonSets here: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/

The Daemonset manifest file looks like this:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: http-daemonset
  labels:
    app: http-daemonset
spec:
  selector:
    matchLabels:
      name: http-daemonset
  template:
    metadata:
      labels:
        app: http-daemonset
    spec:
      containers:
      - name: http-daemonset
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

Notice that we removed the "replicas" section as this is not relevant to DaemonSets.

Let's run the Daemonset and inspect what we get after.

`kubectl apply -f ./resources/http-daemonset.yaml`{{execute}}

`kubectl get pods,daemonset,rs`{{execute}}

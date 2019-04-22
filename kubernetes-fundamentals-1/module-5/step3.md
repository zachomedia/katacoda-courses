In the last section we will check out the StatefulSet deployment type.

Like a Deployment , a StatefulSet manages Pods that are based on an identical container spec. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

More info on StatefulSets here: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/

Let's see what a StatefulSet manifest file looks like.

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: http-statefulset
  labels:
    app: http
spec:
  replicas: 3
  selector:
    matchLabels:
      app: http-statefulset
  template:
    metadata:
      labels:
        app: http-statefulset
    spec:
      containers:
      - name: http-statefulset
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

We can see that this is almost exactly the same as the Deployment spec with just the "kind" being different.

Let's deploy the StatefulSet and see it differs from the standard Deployment.

`kubectl apply -f ./resources/http-statefulset.yaml`{{execute}}

`kubectl get pods,sts`{{execute}}

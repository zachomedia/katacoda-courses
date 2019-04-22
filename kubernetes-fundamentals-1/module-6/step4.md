Pods are one or more containers executing in the same context. However, they
don't have any special properties like: replication, self-healing, or state
management. ReplicaSets and Deployments help us accomplish these.

**ReplicaSets** instruct Kubernetes to run a certain number of copies of a
given Pod. If an individual Pod ever goes down, Kubernetes will reschedule
another one. This allows the creation of *highly available* applications.

**Deployments** provide versioned updates to Pods and Replica Sets.
Deployments also track state, and allow you to perform rollbacks if there are
issues with your application.

These two objects are typically defined in the same Kubernetes manifest file.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginxdemos/hello
        ports:
        - containerPort: 80
```

This is the same application we previously deployed, it is a simple Hello-World.
The first set of Metadata configures the Deployment, where give it a name and labels.

The first section in the `spec` field of the Deployment defines the ReplicaSet
that will manage the Pods. In this scenario, there are 3 replicas, and the
ReplicaSet will match Pods with the label `app=nginx`.

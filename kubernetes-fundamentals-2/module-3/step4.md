We can also deploy Kubernetes Secrets to Pods as environment variables. This process is very similar to how we did it with volumes.

First, we'll need a Pod Manifest file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: redis-env
spec:
  containers:
  - name: redis-container
    image: redis
    env:
      - name: USERNAME
        valueFrom:
          secretKeyRef:
            name: login-credentials
            key: username
      - name: SECRET_PASSWORD
        valueFrom:
          secretKeyRef:
            name: login-credentials
            key: password
```

This is almost identical to how we did this with ConfigMaps. Now, we can create the pod:

`kubectl create -f ./resources/pod-env.yaml`{{execute}}

Now, we can go into the Redis container from our Pod and check the environment variables:

`kubectl -it exec redis-env sh`{{execute}}

`env`{{execute}}

We can see our environment variables as defined by the secrets we provided.
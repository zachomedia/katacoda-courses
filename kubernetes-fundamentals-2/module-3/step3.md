Given that we now have two sets of secrets:

* `login-credentials`
* `secret-manifest`

We can deploy this data to via a Manifest file. Consider the example below illustrating how to deploy secrets as volumes within a Pod.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: redis-vol
spec:
  containers:
  - name: redis-container
    image: redis
    volumeMounts:
    - name: config
      mountPath: "/etc/secrets/config"
      readOnly: true
  volumes:
  - name: config
    secret:
      secretName: secret-manifest
    items:
    - key: username
      path: username
    - key: password
      path: password
```

We can see that the Pod specification creates a volume at `/etc/secrets/config`. We then define a volume that populates the content from the `login-credentials` secret.

We can include all secrets by default, or optionally (shown above) include specific values from the Secret object. In the above scenario, we are explicitly using the `username` and `password` secrets. and provided an additional path.

The two secrets will be stored inside the Redis container at `/etc/secrets/config/username` and `/etc/secrets/config/password`.

Those files will have the base64 decoded values of the secrets

You can also specify the read-write-execute mode of the secrets with the `mode` parameter on a per key basis, or for all keys with the `defaultMode` value.

`kubectl create -f ./resources/pod-volume.yaml`{{execute}}

Now that we've created the pod, we can open up a bash shell:

`kubectl exec -it redis-vol -- /bin/bash`{{execute}}

Now, we can check out that those secret files exist in the container:

`cat /etc/secrets/config/username`{{execute}}

`cat /etc/secrets/config/password`{{execute}}

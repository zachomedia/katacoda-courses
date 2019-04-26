Secrets enable us to provide sensitive information to running Pods. The easiest way to create them is via the command line.

We have 2 files in /resources that contain sensitive data:

`cat ./resources/username`{{execute}}

`cat ./resources/password`{{execute}}

These files are populated by running the following:

`echo -n 'admin' > ./username`

`echo -n 'password' > ./password`

Once you have these files, you can create a Kubernetes secret with the following:

`kubectl create secret generic login-credentials --from-file=./resources/username --from-file=./resources/password`{{execute}}

Now, we can view the secret with kubectl:

`kubectl get secrets`{{execute}}

```
NAME                  TYPE                                  DATA      AGE
login-credentials     Opaque                                2         51s
```

We can get even more information with:

`kubectl describe secret login-credentials`{{execute}}

Note that Kubernetes will not give us the values of the secrets, these are only provided to Pods at runtime in the form of directories and environment variables.

The actual data is stored in Etcd, by default in Base 64 encoded form. This data can be encrypted at rest, but that is beyond the scope of this lab. For more information, please see the Kubernetes [documentation](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/).

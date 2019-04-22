To start off, let's create a local `emptyDir` volume for a Pod. An `emptyDir` volume has the same lifecycle as the Pod. If the container(s) in the Pod restart or ccrash, the volume will live on and persist data. However, if the Pod is removed, then the volume will be removed as well.

First, let's look at a simple Pod Manifest:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: nginx-data
      mountPath: /data/nginx
  volumes:
  - name: nginx-data
    emptyDir: {}
```

In this Manifest file, we create a `Pod` and provide a container specification to run nginx. In this scenario, we are creating a local volume for nginx. It will be mounted inside of the nginx container at `/data/nginx`.

On the host system, Kubernetes will provide an empty directory for storage.

Next, let's launch this Pod, and store some data:

`kubectl create -f ./resources/nginx-local.yaml`{{execute}}

We can see that the Pod was started:

`kubectl get pods --watch`{{execute}}

Once it has successfully started, let's go into the nginx container and drop a file.

`kubectl exec -it nginx -- touch /data/nginx/test.txt`{{execute interrupt}}

Now, let's force the nginx container in the Pod to restart.
At this point, the Kubelet will destroy that container, and start a new one.

`pkill nginx & kubectl get pods --watch`{{execute}}

Now, we can open up another bash session into the container, and we'll find that our file is still there:

`kubectl exec nginx -- ls /data/nginx/`{{execute interrupt}}

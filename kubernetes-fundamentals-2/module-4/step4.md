Now that we have PersistentVolumes and a PersistentVolumeClaim, we can provide the Claim to a Pod, and Kubernetes will provision storage.

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
    persistentVolumeClaim:
      claimName: nginx-pvc
```

This is very similar to the first Pod that we initially created with local storage. Now, we have basically changed what provides the Storage with the addition of those bottom two lines. To deploy our pod, execute the following:

`kubectl create -f ./resources/nginx-persistent.yaml`{{execute}}

We can see that the Pod was created, and that the Claim was fulfilled:

`kubectl get pods --watch`{{execute}}

`kubectl get pvc`{{execute interrupt}}
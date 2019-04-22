Now that we have a PersistentVolume, let's make a PersistentVolumeClaim to provide storage to a Pod. PersistentVolumeClaims enable you to request a certain amount of storage from a PersistentVolume, and reserve it for your Pod.

The following is a PersistentVolumeClaim:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pvc
spec:
  # Notice the storage-class name matches the storage class in the PV we made in the previous step.
  storageClassName: local-storage
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

This PersistentVolumeClaim is requesting 10 GB of storage from a local Filesystem PersistentVolume. When a Pod uses this Claim, Kubernetes will attempt to satisfy the claim by enumerating all PersistentVolumes, and matching the requirements in this Claim to what is present in the cluster.

If we were to match this Claim to PersistentVolume, it would succeed, because we have a PersistentVolume of type Filesystem with 100 GB of storage.

Let's create the PersistentVolumeClaim:

`kubectl create -f ./resources/pv-claim.yaml`{{execute}}

and wait until the resource is available:

`kubectl get pvc --watch`{{execute}}

We can also use label selectors to aid in matching Claims with PersistentVolumes.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  selector:
    matchLabels:
      env: dev
```

This Claim is identical to the previous one, but it will only be matched with PersistentVolumes that have the label `env: dev`. You can use this to have more control over which Claims bind to a particular PersistentVolume.

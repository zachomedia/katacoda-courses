PersistentVolumes abstract away the low-level details of a storage device, and provide a high-level API to provide such storage to Pods.

PersistentVolumes are storage inside of your cluster that has been provisioned by your administrator. Their lifecycle is external to your Pods or other objects.

There are many different types of PersistentVolumes that can be used with Kubernetes. As an example, you can use a local filesystem, NFS, and there are plugins for cloud vendor storage solutions like Elastic Block Storage.

We specify PersistentVolumes via a Manifest file:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: local-pv
spec:
  capacity:
    storage: 3Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: local-storage
  hostPath:
    path: "/mnt/data"
```

This describes a single PersistentVolume. It is mounted to `/mnt/data` on a node. It is of type Filesystem, with 3 GB of storage.

> Note: `hostPath` are only appropriate for testing in single node environments.

We can create this PersistentVolume:

`kubectl create -f ./resources/pv-local.yaml`{{execute}}

We can then view it with:

`kubectl get pv`{{execute}}

We can get even more information with:

`kubectl describe pv local-pv -o yaml`{{execute}}

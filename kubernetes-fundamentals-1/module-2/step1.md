Kubernetes is a system made up of many individual components, as we're discussed. In general, you'll deploy Kubernetes 2 primary ways:

1. packages
2. bootstrapped

Installing Kubernetes via packages is straightforward, you can install the `apiserver`, `etcd`, `kubelet`, and all the scheduler and control loops this way. However, you can also bootstrap Kubernetes to run the Kubernetes system components.

We can view these components by looking at the system Pods:

`kubectl get pods --all-namespaces`{{execute}}

```
NAMESPACE     NAME                             READY     STATUS    RESTARTS   AGE
kube-system   coredns-78fcdf6894-22d7r         1/1       Running   0          14m
kube-system   coredns-78fcdf6894-88lnk         1/1       Running   0          14m
kube-system   etcd-master                      1/1       Running   0          13m
kube-system   kube-apiserver-master            1/1       Running   0          12m
kube-system   kube-controller-manager-master   1/1       Running   0          12m
kube-system   kube-proxy-fsptk                 1/1       Running   0          13m
kube-system   kube-proxy-qkzmf                 1/1       Running   0          14m
kube-system   kube-scheduler-master            1/1       Running   0          13m
kube-system   weave-net-s2gxg                  2/2       Running   1          14m
kube-system   weave-net-xsq4m                  2/2       Running   1          13m
```

We can see that the `kube-apiserver`, `kube-controller-manager`, `kube-proxy`, `kube-scheduler`, and `etcd-master` are all running in Kubernetes. In addition, we see `coredns` (provides clusterDNS) and `weave-net` (the CNI plugin) running as well.

These Pods are running in the `kube-system` namespace, which is a special namespace reserved for Kubernetes system components.

What we don't see is the `kubelet`. That is becase the `kubelet` is a binary that runs on the host, not as a Pod. We executed this command on the `Master` node. We know from our previous lab that this cluster has 2 nodes, including a `worker`. We won't be able to run `kubectl` commands from the Worker, only the Master.

When you use the `kubeadm` tool to build your cluster, you will get this bootstrapped deployment.

In addition, you can check out [kubespray](https://github.com/kubernetes-sigs/kubespray), a way to build a production-ready Kubernetes cluster with Ansible. However, it requires **significant** expertise and configuration to work properly.

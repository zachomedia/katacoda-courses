When you first install Kubernetes, you need to create a `kubeconfig` file to access the cluster. This file defines your user account information, including which namespaces and other cluster resources you have access to.

It is generally stored in `~/.kube/config`, although you can pass it to the CLI with an argument.

Let's view our `kubeconfig` file:

`cat ~/.kube/config`{{execute}}

```
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJT...
    server: https://172.17.0.70:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: LS0tLS1CRUdJT...
    client-key-data: LS0tLS1CRUdJTiBSU0...
```

The first part defines the cluster this config file provides access to, including IP address and the cluster's CA.

The second part defines the cluster user, including name, role, certificates and private key.

When you provision access to your cluster for other users or Continuous Integration, each user will have their own kubeconfig file defining their access.
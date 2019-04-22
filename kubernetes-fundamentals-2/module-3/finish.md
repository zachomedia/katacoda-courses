Secrets are powerful Kubernetes objects that let you deploy sensitive data to Pods. There are several other use-cases that can be solved with Kubernetes Secrets.

You can [encrypt secrets at rest in Etcd](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/), and you can also deploy your secrets as [hidden files](https://kubernetes.io/docs/concepts/configuration/secret/#use-cases).

In addition, you can provide Docker Registry credentials to all pods deployed by a Service Account, deploy SSH keys to applications, etc.

Congratulations, you now have an understang of Kubernetes Secrets next we will be taking a look at Kubernetes Persistent Volumes.

![Digital Academy Logo](/sylus/courses/kubernetes-fundamentals-2/module-4/assets/digital-academy-logo.png)

Welcome to the Digial Academy's "Kubernetes Fundamentals" series. This is Module 4 - Introduction to Persistent Volumes.

In this lab, we will create PersistentVolumes, and provide them to Pods via PersistentVolumeClaims.

Welcome to the Persistent Volumes and Claims lab. We'll learn the basics of how to manage persistent storage, and how to supply this storage to running Pods.

In general, our microservices are stateless, so they won't need any persistent storage. However, microservices are almost never truly stateless, and this can be important. In addition, you might be running a Database in your Kubernetes cluster, and want to provide it Kubernetes-managed persistent storage.

For more information, see the Kubernetes [documentation](https://kubernetes.io/docs/concepts/storage/persistent-volumes/).

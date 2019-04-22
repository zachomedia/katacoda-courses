At its core, Kubernetes is an API. The `kubectl` binary wraps the REST API in a CLI, however, you can directly access the REST API if you want.

First, you need to open a new shell, and run kube-proxy:

`kubectl proxy --port=8080 &`{{execute}}

Now, we can go back to our first shell and execute requests directly against the API:

`curl http://localhost:8080/`{{execute}}

This will give us a listing of all API endpoints that we can access

```
{
  "paths": [
    "/api",    "/api/v1",
    "/apis",
    "/apis/",    "/apis/admissionregistration.k8s.io",
    "/apis/admissionregistration.k8s.io/v1beta1",
    "/apis/apiextensions.k8s.io",    "/apis/apiextensions.k8s.io/v1beta1",
    "/apis/apiregistration.k8s.io",
    "/apis/apiregistration.k8s.io/v1",    "/apis/apiregistration.k8s.io/v1beta1",
    "/apis/apps",
    "/apis/apps/v1",
    ...
}
```

Let's get the version:

`curl http://localhost:8080/version`{{execute}}

We can also check the health of the API Server:

`curl http://localhost:8080/healthz`{{execute}}

The same goes for etcd:

`curl http://localhost:8080/healthz/etcd`{{execute}}

Let's next see the different application APIs that are supported:

`curl http://localhost:8080/apis/apps`{{execute}}

```
{
  "kind": "APIGroup",
  "apiVersion": "v1",
  "name": "apps",
  "versions": [
    {
      "groupVersion": "apps/v1",
      "version": "v1"
    },
    {
      "groupVersion": "apps/v1beta2",
      "version": "v1beta2"
    },
    {
      "groupVersion": "apps/v1beta1",
      "version": "v1beta1"
    }
  ],
  "preferredVersion": {
    "groupVersion": "apps/v1",
    "version": "v1"
  }
}
```

These are the different API versions that are supported on this Kubernetes cluster. Kubernetes typically supports `alpha` and `beta`, in addition to their production ready components. We can see that here.

Let's look at all `v1` (production-ready) app objects in our cluster:

`curl http://localhost:8080/apis/apps/v1`{{execute}}

This shows us every `apps/v1` object, and their configuration. Let's pick a specific type:

`curl http://localhost:8080/apis/apps/v1/deployments`{{execute}}

A Deployment is a high-level abstraction that manages a containerized application. Now we have the listing of all `v1` Deployments. Let's inspect a single one:

`curl http://localhost:8080/apis/apps/v1/namespaces/kube-system/deployments/coredns`{{execute}}

Now we are seeing the configuration for a single object, the `coredns` Deployment.

The Kubernetes API is extremely powerful, and flexible. You can create custom objects, you can also monitor your applications very well this way.

However, we'll generally use `kubectl` to do this for us.

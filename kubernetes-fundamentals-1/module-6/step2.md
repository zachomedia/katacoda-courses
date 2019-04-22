Labels and Selectors are the bread and butter of Kubernetes. Labels are key=value pairs that are attached to Kubernetes objects. Selectors allow one object to manage one or more other objects that satisfy the selector.

For example, let's say that we want to deploy WordPress. We'll give the WordPress Pods a label of `app=wordpress`. Then, we'll set the ReplicaSet selector to manage Pods with a label `app=wordpress`.

If we look at the application we deployed in the previous step, we can see it in action:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginxdemos/hello
        ports:
        - containerPort: 80
```

In this Deployment manifest file, we create a deployment called `nginx-deployment`. The Deployment manages the state of all objects. Next, we provide a `spec` for the Deployment. In the `spec`, we are configuring the ReplicaSet to manage Pods in our Deployment. We can see that the ReplicaSet has a selector, and matches on the label `app=nginx`. Consequently, in the `template` field that describes the Pod, we can see the `app=nginx` labels applied as metadata to the Pods.

This is what allows the ReplicaSet to manage the Pods.

Selectors can use logical operators as well, and objects can have multiple labels. For example, if we are deploying Wordpress, the frontend might have `app=wordpress` and `tier=frontend`. The MySQL database might have `app=wordpress` and `tier=backend`. This lets us use more complex logic when configuring which objects can manage others.

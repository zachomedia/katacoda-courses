First, we need to deploy a simple HTTP Server that we'll then redirect traffic to with a Service.

Our Deployment is located in `./resources/deployment.yaml`.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: http-server
spec:
  selector:
    matchLabels:
      app: http-server
  replicas: 2
  template:
    metadata:
      labels:
        app: http-server
    spec:
      containers:
      - name: http-server
        image: katacoda/docker-http-server
        ports:
        - containerPort: 80
```

Now let's apply the deployment file in Kubernetes.

- Deploy the HTTP server into k8s using the deployment file. `kubectl apply -f ./resources/deployment.yaml`{{execute}}
- Check to make sure there are 2 HTTP pods running. `kubectl get pods -o wide`{{execute}}
- Lastly, lets check to make sure we can access the pods using curl.

We see the IP addresses of our Pods from the `kubectl get pods -o wide` command. You can access their content via `curl`.

Note that each pod has its own unique IP address and ID. These are the pods local IPs on the worker node they are running on. These IPs are typically only accessible from within the cluster. Their IP address will change when the pods are changed/recreated. To provide a stable way to access them from other pods in the cluster, we will create a service of type `ClusterIP`. In the next step we will deploy a service that leverages the ClusterIP.

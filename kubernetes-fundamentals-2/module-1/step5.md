Getting Pods to communicate is relatively easy. First, let's create a simple Deployment (`./resources/nginx.yaml`):

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: other-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 1
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

Now, create the Deployment: `kubectl create -f ./resources/nginx.yaml`{{execute}}
View the newly created pod: `kubectl get pods`{{execute}}

Next, open up a shell in the Pod with `kubectl exec -it <pod-name> bash`.

NOTE: Use this command `kubectl exec -it $(kubectl get pods | grep other* | awk '{print $1}') bash`{{execute}}

Now that we're in the Pod, we can access the other Pod via the name of the Service that proxies it. In this case, the name of the Service is `http-server-service`.

`ping http-server-service`{{execute}}

Unfortunately, that won't work. Remember, production Docker images only include the code they need to execute the application. In this case, it doesn't need `ping`. Let's install it:

`apt update`{{execute}}

`apt install -y inetutils-ping`{{execute}}

Now, we can run ping!

`ping http-server-service`{{execute}}

Unfortunately, this doesn't quite work either, but we've made progress!

`PING http-server-service.default.svc.cluster.local (10.107.162.182): 56 data bytes`

We can see that DNS attached some stuff to our request domain. However, we don't get a response from the server. Remember, our Service is running port 80, and is only designed to respond to HTTP.

Let's install curl:

`apt install -y curl`{{execute}}

Now, we can access the web server:

`curl http-server-service`{{execute}}

And, we finally get a response:

`<h1>This request was processed by host: http-server-c98fbd7b9-czwts</h1>`

This capability is extremely useful. We now have a deterministic way to have one Pod contact other Pods with Kubernetes' built-in DNS. This makes networking applications much easier. However, this only works for cluster-internal traffic. What about external traffic?

## Cleanup

Exit the Pod with: the `exit` command.
<!-- `exit`{{execute}} -->

Make sure you delete all of the ClusterIP services with
`kubectl delete service http-server-service`{{execute}}

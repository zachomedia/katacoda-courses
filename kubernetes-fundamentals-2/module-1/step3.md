In this step we will deploy a Service that exposes the HTTP server pods using a ClusterIP. We can very easily do this on the command line:

`kubectl expose deployment http-server --type=ClusterIP --port=80`{{execute}}

This creates a ClusterIP Service that serves traffic to the `http-server` Deployment. To reach the backend Deployments, you will need to access the service name using port 80. The name of the Service is `http-server`, which is the same as our Deployment. This is not always the case.

Let's see our Service:

`kubectl get services`{{execute}}

We can see our `http-server` has a type of ClusterIP. In addition, it has a
VIP - Virtual IP. We can also see that the Service is listening on port `80`.

Now, we can execute a CURL against that VIP from anywhere in our cluster.

`curl http://$SERVICE_IP`

In fact, we can run CURL a few more times and you'll see that the requests are balanced between the two pods.

> NOTE: curl your own http-server using: `curl $(kubectl get services | grep http-server | awk '{print $3}' )`{{execute}}

If you are able to deploy stateless microservices, you can now almost trivially scale them for high availability.

For now, let's delete our ClusterIP:

`kubectl delete service http-server`{{execute}}

In this step we will deploy a Service that exposes the HTTP server pods using a NodePort. We can very easily do this on the command line:

`kubectl expose deployment http-server --type=NodePort --port=80`{{execute}}

This creates a NodePort Service that serves traffic to the `http-server` Deployment. To reach the backend Deployments, you will need to access the service name using port 80. The name of the Service is `http-server`, which is the same as our Deployment. This is not always the case.

Let's see our Service:

`kubectl get services`{{execute}}

```
NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)       AGE
http-server   NodePort    10.110.125.231   <none>        80:30820/TCP  3s
kubernetes    ClusterIP   10.96.0.1        <none>        443/TCP       1h
```

We can see our `http-server` has a type of NodePort. In addition, it has a VIP - Virtual IP. In this case, mine is `10.110.125.231`. We can see that the Service is listening on port 80.

Remember, when we create a NodePort, we also get a ClusterIP as well.

Now, we can execute a CURL against that VIP from anywhere in our cluster.

```
master $ curl 10.110.125.231:80
<h1>This request was processed by host: http-server-7d798c8fdd-2j8vn</h1>
```

## External Access

If we look at our service definition more closely, we can see there is a little more information:

```
PORT(S)
80:30820/TCP
```

This shows the high port needed to access the ClusterIP service from outside the cluster. Let's access it from the command line:

`curl node01:[YOURPORT]`

NOTE: you can get a list of nodes using: `kubectl get nodes`{{execute}}

We'll get a response, which is great. We can even access it from our Katacoda session.
Click on the link below, then enter the external port exposed by the NodePort.

https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/

or to CURL from the command line, first export the external VIP to a PORT variable:

`export PORT=$(kubectl get services | grep http* | awk '{print $5}' | cut -b 4-8)`{{execute}}

then CURL the Katacoda URL:

`curl https://[[HOST_SUBDOMAIN]]-$PORT-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

You should see a message similar to: `<h1>This request was processed by host: http-server-c98fbd7b9-xlt5l</h1>`

Now we can see how this would apply if we wanted to serve end-users traffic to our applications behind the firewall:

1. Create a NodePort service.
1. Configure the Load Balancer to direct traffic for our application to all hosts in the cluster at the NodePort.

In this step we will deploy a Service that exposes the HTTP server pods using a ClusterIP. We can very easily do this on the command line:

`kubectl expose deployment http-server --type=ClusterIP --port=80`{{execute}}

This creates a ClusterIP Service that serves traffic to the `http-server` Deployment. To reach the backend Deployments, you will need to access the service name using port 80. The name of the Service is `http-server`, which is the same as our Deployment. This is not always the case.

Let's see our Service:

`kubectl get services`{{execute}}

```
NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
http-server   ClusterIP   10.101.110.51   <none>        80/TCP    3s
kubernetes    ClusterIP   10.96.0.1       <none>        443/TCP   46m
```

We can see our `http-server` has a type of ClusterIP. In addition, it has a
VIP - Virtual IP. In this case, mine is `10.101.110.51`. We can also see that
the Service is listening on port `80`.

Now, we can execute a CURL against that VIP from anywhere in our cluster.

```
master $ curl 10.101.110.51:80
<h1>This request was processed by host: http-server-7d798c8fdd-2j8vn</h1>
```

In fact, we can run CURL a few more times:

```
master $ curl 10.101.110.51:80
<h1>This request was processed by host: http-server-7d798c8fdd-k96pk</h1>
master $ curl 10.101.110.51:80
<h1>This request was processed by host: http-server-7d798c8fdd-2j8vn</h1>
master $ curl 10.101.110.51:80
<h1>This request was processed by host: http-server-7d798c8fdd-k96pk</h1>
master $ curl 10.101.110.51:80
<h1>This request was processed by host: http-server-7d798c8fdd-2j8vn</h1>
```

NOTE: curl your own http-server using: `curl $(kubectl get services | grep http-server | awk '{print $3}' )`{{execute}}

Every time we execute CURL, the packets are routed to the Service. The Service then load balances the requests across healthy replicas.

If you are able to deploy stateless microservices, you can now almost trivially scale them for high availability.

For now, let's delete our ClusterIP:

`kubectl delete service http-server`{{execute}}

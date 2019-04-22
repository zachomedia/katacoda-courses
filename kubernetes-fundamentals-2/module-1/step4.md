Next, we can create a Manifest for our Service. These are much simpler than our Deployments or PodSpecs.

We have a Service for our Deployment defined in `./resources/service.yaml`

```yaml
apiVersion: v1
kind: Service
metadata:
  name: http-server-service
spec:
  type: ClusterIP
  selector:
    app: http-server
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
```

This has identical configuration to what we did during the last step.

`port` is the port that other services will use to reach this service

`targetPort` is the port that the Pod is listening in on

Now let's apply the service file in Kubernetes.
- Deploy the service into k8s using the services.yaml file. `kubectl apply -f ./resources/service.yaml`{{execute}}
- Check to make sure the service was deployed and what ClusterIP was assigned. `kubectl get svc -o wide`{{execute}}
- Run a curl against the ClusterIP shown for the http-server-service. `curl YOURCLUSTERIP` (*you will need to type this manually using the clusterip of your specific service*)
- Run the curl a few more times (press up arrow to show command again) and notice that each time you run it, a different pod behind the service responds.

You have now successfully deployed multiple pods and exposed them to the rest of the cluster using a ClusterIP.


At this point, we have a Deployment and a Service to proxy and load balance
requests. ClusterIP is useful to let your backend Pods communicate with each other.

Next, we will create another Deployment so we can see how to use Kubernetes' built-in DNS.

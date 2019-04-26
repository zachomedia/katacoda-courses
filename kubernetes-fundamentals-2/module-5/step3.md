## Create another ingress record

Let's create an ingress record for the vote service:

`cat resources/result-ingress.yaml`{{execute}}

`kubectl apply -f resources/result-ingress.yaml`{{execute}}

We should now see the new ingress listed:

`kubectl -n vote get ingress`{{execute}}

## Test the ingress

Again, normally we would expose this to the internet and type `result.example.com` in our browser. Since we don't have any DNS configured, we're going to simulate this.

1. Get the host port for traefik: `kubectl get svc -l release=traefik`{{execute}}. Look for the number next to `80:`
2. Run `curl -H 'Host: result.example.com' http://node01:$TREAFIK_PORT`

You should see the output of the results application.

Now that we have an ingress controller, let's make use of it.

Remember that vote app we introduced in an earlier module? Let's use it again:

`git clone https://github.com/dockersamples/example-voting-app.git`{{execute}}

`cd example-voting-app`{{execute}}

`kubectl create ns vote`{{execute}}

`kubectl apply -f k8s-specifications`{{execute}}

`cd ..`{{execute}}

## Creating the ingress record

Let's create an ingress record for the vote service:

`cat resources/vote-ingress.yaml`{{execute}}

`kubectl apply -f resources/vote-ingress.yaml`{{execute}}

We should now see the ingress listed:

`kubectl -n vote get ingress`{{execute}}

> Note: Reminder that we need to make use of the namespace we created the app in.

## Test the ingress

Normally we would expose this to the internet and type `vote.example.com` in our browser. Since we don't have any DNS configured, we're going to simulate this.

1. Get the host port for traefik: `kubectl -n kube-system get svc -l release=traefik`{{execute}}. Look for the number next to `80:`
2. Run `curl -H 'Host: vote.example.com' http://node01:$TREAFIK_PORT`

You should see the output of the vote application.

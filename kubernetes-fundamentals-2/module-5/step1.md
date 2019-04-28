As you can see from all the output spewing on the terminal, we're doing a bunch of work to setup this module. It's not important at this time, but we will teach you everything later (Kubernetes CNCF - Helm). Consider it magic.

## What is an Ingress Controller?

An ingress controller provides an HTTP gateway to applications in the cluster. We expose the ingress controller to the internet, and it will route requests to the applications based on hostname, path or other conditions.

> An ingress controller can save us cost, as we don't need to get a public IP for every application we wish to expose.
>
> It also lets us do more complicated request routing without having to add it to our application.

![Traefik Logo](/sylus/courses/kubernetes-fundamentals-2/module-5/assets/traefik.png)

Remember all that magic from earlier? We deployed [Traefik](https://traefik.io) to your cluster. It's a Kubernetes ingress controller, designed for the cloud. Other options include:

- Nginx ingress controller
- HAProxy ingress controller
- Caddy
- Istio ingress gateway
- and many more!

## Check that it's running

Let's make sure Traefik is ready to go. Check the pod is running: `kubectl -n kube-system get pods -l release=traefik`{{execute}}

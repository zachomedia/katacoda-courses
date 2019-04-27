Now that we've explored ConfigMaps in detail, lets perform a real-wold deployment.

We will provide a Redis pod configuration via a ConfigMap. Given everything we know about Redis, this is pretty easy.

We have a Redis configuration file located at `redis-config`

First, we'll create a ConfigMap from this file.

`kubectl create configmap redis-config --from-file=./configs/redis-config`{{execute}}

Let's take a look at whats stored inside the ConfigMap:

`kubectl get configmap redis-config -o yaml`{{execute}}

Next, we'll create a Pod that runs Redis, and provide the configuration via a ConfigMap.

Here is our YAML file:

`cat ./resources/redis.yaml`{{execute}}

Now, we can run this pod:

`kubectl create -f ./resources/redis.yaml`{{execute}}

Now that we've got the Pod running healthy, let's exec into it, and see what's there:

`kubectl exec -t -i redis redis-cli`{{execute}}

Now, we're using the redis-cli inside of the Redis pod. Let's get the data we configured in our Redis ConfigMap.

`CONFIG GET maxmemory`{{execute}}

`CONFIG GET maxmemory-policy`{{execute}}

Now, exit from the shell, and let's clean up the environment:

`kubectl delete configmap dir-config`{{execute}}

`kubectl delete configmap person-config`{{execute}}

`kubectl delete configmap redis-config`{{execute}}

Let's also get rid of our Pods:

`kubectl delete pod alpine-volume`{{execute}}

`kubectl delete pod redis`{{execute}}

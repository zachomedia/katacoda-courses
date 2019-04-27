Next, we will deploy our Vue.js hello world application.

## Deployment

Let's create our Deployment:

`kubectl create -f ./resources/vue.yaml`{{execute}}

## Service

Once you've deployed the Vue.js application, create a Service so it is reachable
from the outside world. To do this, create a service, and verify that everything
is working correctly.

> Note the port should be set to `8080`.

`touch ./resources/vue-svc.yaml`{{execute}}

After creating the service file contents, create the service:

`kubectl apply -f vue-svc.yaml`{{execute}}

List the services, note the external port, then click the following link and
enter the external port:

`kubectl get svc`{{execute}}

https://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/

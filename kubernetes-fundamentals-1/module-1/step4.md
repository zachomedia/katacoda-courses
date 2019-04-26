Lastly, we will clone the Vote App repository and run it in the cluster.

1) First, let's clone the Github repo.

`git clone https://github.com/dockersamples/example-voting-app.git`{{execute}}

2) Now let's change to that directory and deploy the environment.

`cd example-voting-app`{{execute}}

3) Let's create a new namespace called `vote`.

`kubectl create namespace vote`{{execute}}

> There are many strategies for using namespaces. Strategies include:
>
> 1. One namespace per application
> 2. One namespace per project
> 3. One namespace per environment (dev, test, qa, uat, prod)
>
> Note: While namespaces appear to provide isolation, this is not
> enough. More advanced concepts are required to provide full
> isolation between namespaces (Multi Tenancy).

4) Let's deploy all of the objects from the k8s-specification folder.

`kubectl apply -f k8s-specifications`{{execute}}

> We recommend taking a quick glance at the YAML files using
> `cat k8s-specifications/*.yaml`{{execute}}
>
> We will cover each object type in subsequent sections of this tutorial.

5) Now let's monitor the deployment status of the Vote components.

`watch -n .5 kubectl get pods,deploy,svc -o wide -n vote`{{execute}}

Once they are all running, press *"CTRL+C"* to exit the watch.

Lets view the app, vote on a pet, then view the results.

- To vote, click this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/

- To view results, click this link: https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/

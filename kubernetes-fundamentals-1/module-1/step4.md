Lastly, we will clone a the Vote App repository and run the application on the cluster.

1) First, lets clone the Github repo.

`git clone https://github.com/dockersamples/example-voting-app.git`{{execute}}

2) Now lets change to that directory and deploy the environment.

`cd example-voting-app`{{execute}}

3) This creates a new namespace called vote.

`kubectl create namespace vote`{{execute}}

4) This will deploy all of the YAML configurations in the k8s-specification folder.

`kubectl apply -f k8s-specifications`{{execute}}

5) Now lets monitor the deployment status of the Vote components.

`watch -n .5 kubectl get pods,deploy,svc -o wide -n vote`{{execute}}

Once they are all running, press *"CTRL+C"* to exit the watch.

Lets view the app, vote on a pet, then view the results.

- To vote, click this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/

- To view results, click this link: https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/

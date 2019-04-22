The Kubernetes dashboard allows you to view your applications in a UI. In this deployment, the dashboard has been made available on port 30000.

To deploy the dashboard, run the following command.

`kubectl apply -f https://gist.githubusercontent.com/sylus/1237af2e74fa686ac8f0aa54c45c3294/raw/89089ecdd7861db983a754517ca37a06eab4c7c8/kube-dashboard.yml`{{execute}}

Now we can check to see if the Dashboard pod is running.

`kubectl get pods --selector=k8s-app=kubernetes-dashboard -n kube-system`{{execute}}

And we can also check to see what port the Dashboard is exposed on.

`kubectl get svc -n kube-system`{{execute}}

Once the Pod is in a running state, we can view the dashboard using the link below.

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/

As you can see, the dashboard gives us a graphical view of our cluster. We can see all of the objects in the cluster, and actually schedule workloads. We won't be using the dashboard during these training sessions, but as you continue your Kubernetes learning journey, it is a great resource.

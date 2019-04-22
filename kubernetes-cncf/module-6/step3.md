Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster. Deploy the dashboard.

`kubectl apply -f ./resources/dashboard.yaml`{{execute}}

The dashboard is deployed into the kube-system namespace. View the status of the deployment with

`kubectl get pods -n kube-system`{{execute}}

When the dashboard was deployed, it was assigned a NodePort of 30000. This makes the dashboard available to outside of the cluster and viewable. Because the dashboard can be accessed publicly, it is protected and requires login credentials. Because you have administration access to this cluster copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the sign prompt select _Token_ and paste in the key you copied in the previous step.

Explore how Knative and Istio have been installed.

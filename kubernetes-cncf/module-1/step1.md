![Helm Logo](/sylus/courses/kubernetes-cncf/module-1/assets/helm-logo.png)

Helm is a cluster administration tool that manages _charts_ on Kubernetes.

Helm relies on a packaging format called _charts_. Charts define a composition of related Kubernetes resources and values that make up a deployment solution. Charts are source code that can be packaged and maintained in version control. Inside the chart are Kubernetes YAML files along with a templating language to allow contextual values to be injected into the YAMLs.

Helm also helps you manage the complexities of dependency management. Charts can also include dependencies to other charts. Charts compliment your [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code) processes. Use Helm effectively with a mature container versioning pipeline.

The Helm CLI tool deploys charts to Kubernetes. A server side component can accept the chart and submit the YAML declarations to Kubernetes. The chart is a deployable unit that can be inspected, listed, updated and removed.

Interact with Helm start with a command-line tool (CLI). Helm can be downloaded from https://github.com/kubernetes/helm/releases

`curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh`{{execute}}

Once installed locally a server side component needs to be started called _Tiller_. The _init_ command starts _Tiller_ and it will be available in a moment.

`helm init`{{execute}}

`kubectl get pods -n kube-system | grep tiller`{{execute}}

Helm has a working set of public repositories. More on this later, but for now the repo cache can be updated.

`helm repo update`{{execute}}

At this point Helm should be healthy.

`helm version`{{execute}}

The current local state of Helm is kept in your environment in the _home_ location.

`ls $(helm home)`{{execute}}

The Helm init command defaults to discovering the host already set in ~/.kube/config. There is a way to change or override the host, but that's beyond the scope of this scenario.

The next step gets right to it by installing a pre-made chart.
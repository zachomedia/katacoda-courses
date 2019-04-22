Create the configuration for Fluent Bit.

Install Fluent Bit and pass the ElasticSearch service endpoint as a chart parameter. This chart will install a DaemonSet that will start a Fluent Bit pod on each node. With this each Fluent Bit services will collects the logs from each node and stream it to ElasticSearch.

`helm install stable/fluent-bit --name=fluent-bit --namespace=logs --set backend.type=es --set backend.es.host=elasticsearch-client`{{execute}}

Fluent Bit will start in a few moments and you can observe its progress.

`watch kubectl get deployments,pods,services --namespace=logs`{{execute}}

Once complete, the _fluent-bit_ Pod will move to the _running_ state in a few seconds. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.

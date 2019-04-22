## Persistent Volume ##

ElasticSearch will be making a PersistentVolumeClaim for its persistence. A PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created.

`mkdir -p /mnt/data/efk-master && kubectl create -f ./resources/pv-master.yaml`{{execute}}

`mkdir -p /mnt/data/efk-data && kubectl create -f ./resources/pv-data.yaml`{{execute}}

## Install ElasticSearch ##

Deploy the public Helm chart for ElasticSearch. The chart's default settings are appropriately opinionated for a production deployment. Here, some of the default settings are downsized to fit in this KataCoda cluster.

`helm install stable/elasticsearch --name=elasticsearch --namespace=logs \
--set client.replicas=1 \
--set master.replicas=1 \
--set cluster.env.MINIMUM_MASTER_NODES=1 \
--set cluster.env.RECOVER_AFTER_MASTER_NODES=1 \
--set cluster.env.EXPECTED_MASTER_NODES=1 \
--set data.replicas=1 \
--set data.heapSize=300m \
--set master.persistence.storageClass=elasticsearch-master \
--set master.persistence.size=5Gi \
--set data.persistence.storageClass=elasticsearch-data \
--set data.persistence.size=5Gi \
--version=1.21.3`{{execute}}

ElasticsSearch will start in a few minutes and you can observe its progress. **Be patient, as it takes time for ElasticSearch to initialize, even with this smaller configuration.**

`watch kubectl get deployments,pods,services --namespace=logs`{{execute}}

Once complete, the 3 Pods will move to the _running_ state. Soon the Deployment status will move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.

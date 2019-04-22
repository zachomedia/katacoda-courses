Like any system, Kubernetes produces many logs. We can get `kubectl` logs with `journalctl`:

`journalctl -l -u kubelet`{{execute}}

```
-- Logs begin at Wed 2019-02-13 17:20:54 UTC, end at Wed 2019-02-13 17:42:26 UTC. --
Feb 13 17:20:54 master systemd[1]: Started kubelet: The Kubernetes Node Agent.
Feb 13 17:20:54 master kubelet[487]: F0213 17:20:54.705918     487 server.go:190] failed to load Kubelet config file /var/lib/kubelet/c
Feb 13 17:20:54 master systemd[1]: kubelet.service: Main process exited, code=exited, status=255/n/a
Feb 13 17:20:54 master systemd[1]: kubelet.service: Unit entered failed state.
Feb 13 17:20:54 master systemd[1]: kubelet.service: Failed with result 'exit-code'.
Feb 13 17:20:55 master systemd[1]: Stopped kubelet: The Kubernetes Node Agent.
Feb 13 17:21:06 master systemd[1]: Stopped kubelet: The Kubernetes Node Agent.
Feb 13 17:21:06 master systemd[1]: Stopped kubelet: The Kubernetes Node Agent.
Feb 13 17:21:06 master systemd[1]: Started kubelet: The Kubernetes Node Agent.
Feb 13 17:21:06 master kubelet[1299]: Flag --cgroup-driver has been deprecated, This parameter should be set via the config file specif
Feb 13 17:21:06 master kubelet[1299]: Flag --cgroup-driver has been deprecated, This parameter should be set via the config file specif
Feb 13 17:21:35 master kubelet[1299]: F0213 17:21:35.255905    1299 server.go:245] unable to load client CA file /etc/kubernetes/pki/ca
Feb 13 17:21:35 master systemd[1]: kubelet.service: Main process exited, code=exited, status=255/n/a
Feb 13 17:21:35 master systemd[1]: kubelet.service: Unit entered failed state.
Feb 13 17:21:35 master systemd[1]: kubelet.service: Failed with result 'exit-code'.
Feb 13 17:21:45 master systemd[1]: kubelet.service: Service hold-off time over, scheduling restart.
Feb 13 17:21:45 master systemd[1]: Stopped kubelet: The Kubernetes Node Agent.
Feb 13 17:21:45 master systemd[1]: Started kubelet: The Kubernetes Node Agent.
Feb 13 17:21:45 master kubelet[1314]: Flag --cgroup-driver has been deprecated, This parameter should be set via the config file specif
Feb 13 17:21:45 master kubelet[1314]: Flag --cgroup-driver has been deprecated, This parameter should be set via the config file specif
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.439093    1314 server.go:408] Version: v1.11.3
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.439509    1314 plugins.go:97] No cloud provider specified.
Feb 13 17:21:45 master kubelet[1314]: E0213 17:21:45.463841    1314 certificate_manager.go:299] Failed while requesting a signed certif
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.476272    1314 server.go:648] --cgroups-per-qos enabled, but --cgroup-root was not
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.476793    1314 container_manager_linux.go:243] container manager verified user spe
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.476923    1314 container_manager_linux.go:248] Creating Container Manager object b
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.478086    1314 container_manager_linux.go:267] Creating device plugin manager: tru
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.478442    1314 state_mem.go:36] [cpumanager] initializing new in-memory state stor
Feb 13 17:21:45 master kubelet[1314]: I0213 17:21:45.478641    1314 state_file.go:82] [cpumanager] state file: created new state file "
```

However, we can't do this for the rest of the system components. Why?

They are deployed via Kubernetes, not Systemd.

To get logs, we need to get them from containers. We can use `docker container logs <container_name>` or, more appropriately, `kubectl logs <pod name>`.

`kubectl -n kube-system logs kube-apiserver-master`{{execute}}

```
Flag --insecure-port has been deprecated, This flag will be removed in a future version.
I0213 17:22:06.560417       1 server.go:703] external host was not specified, using 172.17.0.35
I0213 17:22:06.560723       1 server.go:145] Version: v1.11.3
I0213 17:22:06.968543       1 plugins.go:158] Loaded 8 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,Priority,DefaultTolerationSeconds,DefaultStorageClass,MutatingAdmissionWebhook.
I0213 17:22:06.968566       1 plugins.go:161] Loaded 6 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,Priority,PersistentVolumeClaimResize,ValidatingAdmissionWebhook,ResourceQuota.
I0213 17:22:06.969389       1 plugins.go:158] Loaded 8 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,Priority,DefaultTolerationSeconds,DefaultStorageClass,MutatingAdmissionWebhook.
I0213 17:22:06.969403       1 plugins.go:161] Loaded 6 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,Priority,PersistentVolumeClaimResize,ValidatingAdmissionWebhook,ResourceQuota.
I0213 17:22:07.018931       1 master.go:234] Using reconciler: lease
W0213 17:22:08.686683       1 genericapiserver.go:319] Skipping API batch/v2alpha1 because it has no resources.
W0213 17:22:09.173963       1 genericapiserver.go:319] Skipping API rbac.authorization.k8s.io/v1alpha1 because it has no resources.
W0213 17:22:09.184474       1 genericapiserver.go:319] Skipping API scheduling.k8s.io/v1alpha1 because it has no resources.
W0213 17:22:09.213438       1 genericapiserver.go:319] Skipping API storage.k8s.io/v1alpha1 because it has no resources.
W0213 17:22:09.972499       1 genericapiserver.go:319] Skipping API admissionregistration.k8s.io/v1alpha1 because it has no resources.
[restful] 2019/02/13 17:22:10 log.go:33: [restful/swagger] listing is available at https://172.17.0.35:6443/swaggerapi
[restful] 2019/02/13 17:22:10 log.go:33: [restful/swagger] https://172.17.0.35:6443/swaggerui/ is mapped to folder /swagger-ui/
[restful] 2019/02/13 17:22:11 log.go:33: [restful/swagger] listing is available at https://172.17.0.35:6443/swaggerapi
[restful] 2019/02/13 17:22:11 log.go:33: [restful/swagger] https://172.17.0.35:6443/swaggerui/ is mapped to folder /swagger-ui/
I0213 17:22:11.569734       1 plugins.go:158] Loaded 8 mutating admission controller(s) successfully in the following order: NamespaceLifecycle,LimitRanger,ServiceAccount,NodeRestriction,Priority,DefaultTolerationSeconds,DefaultStorageClass,MutatingAdmissionWebhook.
I0213 17:22:11.569805       1 plugins.go:161] Loaded 6 validating admission controller(s) successfully in the following order: LimitRanger,ServiceAccount,Priority,PersistentVolumeClaimResize,ValidatingAdmissionWebhook,ResourceQuota.
I0213 17:22:15.023364       1 serve.go:96] Serving securely on [::]:6443
I0213 17:22:15.023576       1 apiservice_controller.go:90] Starting APIServiceRegistrationController
I0213 17:22:15.023601       1 cache.go:32] Waiting for caches to sync for APIServiceRegistrationController controller
I0213 17:22:15.024316       1 autoregister_controller.go:136] Starting autoregister controller
I0213 17:22:15.024329       1 cache.go:32] Waiting for caches to sync for autoregister controller
I0213 17:22:15.024849       1 crdregistration_controller.go:112] Starting crd-autoregister controller
I0213 17:22:15.024995       1 controller_utils.go:1025] Waiting for caches to sync for crd-autoregister controller
I0213 17:22:15.032485       1 crd_finalizer.go:242] Starting CRDFinalizer
I0213 17:22:15.035827       1 available_controller.go:278] Starting AvailableConditionController
I0213 17:22:15.035868       1 cache.go:32] Waiting for caches to sync for AvailableConditionController controller
I0213 17:22:15.035897       1 controller.go:84] Starting OpenAPI AggregationController
I0213 17:22:15.086136       1 customresource_discovery_controller.go:199] Starting DiscoveryController
I0213 17:22:15.088076       1 naming_controller.go:284] Starting NamingConditionController
I0213 17:22:15.088124       1 establishing_controller.go:73] Starting EstablishingController
I0213 17:22:15.123737       1 cache.go:39] Caches are synced for APIServiceRegistrationController controller
```

You can do this for the remainder of the system components.
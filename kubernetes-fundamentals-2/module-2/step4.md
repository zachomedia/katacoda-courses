Now that we can create ConfigMap objects, lets use them to configure a Pod.

First, create a config map from our environment file, person-config:

`kubectl create configmap person-config --from-env-file=env/person.env`{{execute}}

There is a very simple Pod YAML file located at `alpine.yaml`. Here is the content:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: alpine-test-pod
spec:
  containers:
    - name: alpine-test
      image: alpine
      command: ["/bin/sh", "-c", "env"]
      env:
        - name: FIRST_NAME
          valueFrom:
            configMapKeyRef:
              name: person-config
              key: name.first
  restartPolicy: Never
```

We can execute this pod, and see the environment variable we defined:

`kubectl create -f ./resources/alpine.yaml`{{execute}}

Notice the command we are running in the container prints `env` to stdout.  We can look at the output by using kubectl logs.

`kubectl logs alpine-test-pod`{{execute}}

We can easily specify the values for multiple environment variables within a Pod by using one or more ConfigMaps. Now, if we want to update a configuration value for a Pod, we just need to update the ConfigMap, and then perform a **rolling update** of the Pods via a Deployment.

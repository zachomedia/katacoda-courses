We can also provide a Pod with environment variables for all `key=value` pairs inside a ConfigMap. This is very useful if you use a single file to provide an entire application's configuration.

There is a very simple Pod YAML file located at `./resources/alpine-all-vars.yaml`. Here is the content:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: alpine-all-vars
spec:
  containers:
    - name: alpine-test
      image: alpine
      command: ["/bin/sh", "-c", "env"]
      envFrom:
        - configMapRef:
            name: person-config
  restartPolicy: Never
```

We can execute this pod, and see the environment variable we defined:

`kubectl create -f ./resources/alpine-all-vars.yaml`{{execute}}

`kubectl logs alpine-all-vars`{{execute}}

Notice, `redis-config` and `game-properties` are environment variables that contain the entire file contents.

What's more, we can even use environment variables inside of Pod commands if we define those environment variables via ConfigMaps.

For example, you can modify the previous file and change the command to:

`command: ["/bin/sh", "-c", "echo $(name.first)"]`

When you now run the Pod, it will output my first name.  Make sure you complete this step before you move on.

We can also populate volumes with ConfigMap data.

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: alpine-volume
spec:
  containers:
    - name: alpine-test
      image:alpine
      command: ["/bin/sh", "-c", "echo /etc/config/"]
      volumeMounts:
      - name: configmap-volume
        mountPath: /etc/config
  volumes:
    - name: configmap-volume
      configMap:
        name: dir-config
  restartPolicy: never
```

You can run this pod, and it will show the contents of `/etc/config` inside the Pod.

`kubectl create -f ./resources/alpine-volume.yaml`{{execute}}

`kubectl logs alpine-volume`{{execute}}

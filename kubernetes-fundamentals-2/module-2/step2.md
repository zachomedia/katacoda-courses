You can also create ConfigMaps from from a file. Your file should have a set of `key=value` pairs.

Creating a ConfigMap from such files is easy:

`kubectl create configmap <name> --from-file=<path-to-file>`

To view a sample file to use with ConfigMaps, execute:

`cat configs/game.properties`{{execute}}

Execute the following to create a ConfigMap from that configuration file:

`kubectl create configmap game-config --from-file=configs/game.properties`{{execute}}

Now that the ConfigMap is created, we can view it with:

`kubectl get configmaps`{{execute}}

We can inspect the contents with:

`kubectl describe configmap game-config`{{execute}}

We can get an even better view with:

`kubectl get configmap game-config -o yaml`{{execute}}

You can also provide multiple values to a ConfigMap:

Creating ConfigMaps from a single file is very useful, because it lets you quickly convert multiple `key=value` pairs into data that Kubernetes objects can ingest. In addition, you can use env-files to provide more verbose source for developers.

```
# env-file
# Comments start with #
# Blank lines are ignored
# All other lines should be key=val
# Any quotes you include will become part of the value

name.first=Jack
name.last=Bauer
age="28"
```

We can create ConfigMaps from env-files very similarly to how we did above, just swap `--from-file` with `--from-env-file`.

`kubectl create configmap person-config --from-env-file=env/person.env`{{execute}}

And, view the ConfigMap:

`kubectl get configmap person-config -o yaml`{{execute}}

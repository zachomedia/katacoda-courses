You can also create ConfigMaps from from a file. Your file should have a set of key=value upairs, one per line. Creating a ConfigMap from such files is easy:

`kubectl create configmap <name> --from-file=<path-to-file>`

To view a sample file to use with ConfigMaps, execute:

`cat configs/game.properties`{{execute}}

Execute the following to create a ConfigMap from that configuration file for a hypothetical video game's configuration:

`kubectl create configmap game-config --from-file=configs/game.properties`{{execute}}

Now that we've created the ConfigMap, we can view it with:

`kubectl get configmaps`{{execute}}

The output should look like this:

```
NAME          DATA      AGE
game-config   4         20s
```

We can inspect the contents with:   

`kubectl describe configmap game-config`{{execute}}

We can get an even better view with:

`kubectl get configmap game-config -o yaml`{{execute}}

You can also provide multiple values to a ConfigMap:

Creating ConfigMaps from a single file is very useful, because it lets you quickly convert multiple key=value pairs into data that Kubernetes objects can ingest. In addition, you can use env-files to provide more verbose source for developers.

```
# I'm an env-file
# Comments start with #
# Blank lines are ignored
# All other lines should be key=val
# Any quotes you include will become part of the value

name.first=David
name.last=Widen
age="28"
```

We can create ConfigMaps from env-files very similarly to how we did above, just swap `--from-file` with `--from-env-file`.

`kubectl create configmap person-config --from-env-file=env/person.env`{{execute}}

And, view the ConfigMap:

`kubectl get configmap person-config -o yaml`{{execute}}

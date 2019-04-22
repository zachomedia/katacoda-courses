We will now deploy software many of probably has heard of, the Minecraft server.

The configuration is relatively simple. Create your base file: 

`touch ./resources/minecraft.yaml`{{execute}}

Now, you need to configure the following values, in addition to everything else necessary to create a Deployment:

1. replicas = 1
2. image = `itzg/minecraft-server`
3. environment variables: `EULA="true"`
4. container port = 25565
5. volume: Pod local = `/data`, use an `emptyDir` for the actual storage

There are many more scaffolding requirements for this Deployment, such as `apiVersion`.

Once you've deployed it, how can we check?

Deploying applications is really easy with Kubernetes. If any of you have softare running on a server in your home, I can almost guarantee someone is currently maintaining a Deployment Manifest for it on GitHub.
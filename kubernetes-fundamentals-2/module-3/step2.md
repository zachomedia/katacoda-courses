You can also create a Kubernetes Secrets object by using a Manifest file. You can provide Secrets data in plaintext, or base64 encoded.

We'll create a Kubernetes Manifest file using a base64 encoded secret. First, we'll need to encode our secrets:

`echo -n 'admin' | base64`{{execute}}


`echo -n 'password' | base64`{{execute}}

Now that we have those 2 values, we can put them into a Kubernetes Manifest file:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret-manifest
type: Opaque
data:
  username: YWRtaW4=
  password: cGFzc3dvcmQ=
```

This file is relatively simple, we set the kind to Secret, and provide the key=Base64(value) to the `data` map. It also provides a `stringData` map which can reverse base64 encoded data.

Now that we have our Manifest file, we can create a Secret using kubectl:

`kubectl create -f ./resources/secret.yaml`{{execute}}

We can now view the secret:

`kubectl get secrets`{{execute}}

And we can get more information from the Secret:

`kubectl describe secret secret-manifest -o yaml`{{execute}}

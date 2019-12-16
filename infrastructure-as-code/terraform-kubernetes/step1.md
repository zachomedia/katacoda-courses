# Configure Terraform project

First, let's make sure that our Terraform command line is working.

Let's quickly check the version of the CLI with `terraform version`{{execute}}.

## Initialize

We have provided you with a scaffold of a Terraform project, which at this point only contains the backends that we will utilize.

`cd terraform`{{execute}}

We can now initialize the project by running:

``terraform init``{{execute}}

## Let's make sure it works

By default, the Kubernetes provider for Terraform will utilize our current Kubecontext.

Run the following command to list the namespaces in the Kubernetes cluster:

`kubectl get namespaces`{{execute}}

<pre class="file" data-filename="terraform/namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
</pre>

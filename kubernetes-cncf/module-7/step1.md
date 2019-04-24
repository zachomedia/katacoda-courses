Show the constraint template:

`cat ./resources/constraint-template.yaml`{{execute}}

Create the create constraint template object:

`kubectl create -f ./resources/constraint-template.yaml`{{execute}}

Show the constraint:

`cat ./resources/constraint.yaml`{{execute}}

Create the constraint policy:

`kubectl create -f ./resources/constraint.yaml`{{execute}}

Reject a request:

`kubectl create namespace test -o yaml`{{execute}}

Show a compliant namespace:

`cat ./resources/namespace-with-labels.yaml`{{execute}}

Create a compliant namespace:

`kubectl create -f ./resources/namespace-with-labels.yaml`{{execute}}

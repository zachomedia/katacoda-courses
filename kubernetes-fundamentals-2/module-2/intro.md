![Digital Academy Logo](/sylus/courses/kubernetes-fundamentals-2/module-2/assets/digital-academy-logo.png)

Welcome to the Digial Academy's "Kubernetes Fundamentals" series. This is Module 2 - Introduction to ConfigMaps.

In this lab, we will decouple configuration from applications with Kubernetes ConfigMaps.

ConfigMaps are a way to decouple configuration from application source code and Kubernetes Pods / Deployment files. If you are familiar with [12-Factor App principles](https://12factor.net/), then this addresses factor 3: "Store config in the environment."

ConfigMaps allow you to independently store data that your application needs in a Kubernetes object. ConfigMaps are decoupled from Pods and Deployments. In addition, ConfigMaps can be consumed by multiple Pods and Deployments, which can be extremely useful. As an example, if you have multiple microservies that need access to the same configuration parameter, all it takes is a single ConfigMap. This used to be accomplished with a Config-Server microservice, or supplying each microservice with the same environment variable, which made updates difficult.

We will go through the process of creating ConfigMaps from literal values, files, and directories. We'll supply these values to Pods as environment variables, and finally create a simple Redis Deployment configured via ConfigMaps.

For more information, see the Kubernetes [documentation][docs].

<!-- Links Referenced -->

[docs]:           https://cloud.google.com/kubernetes-engine/docs/concepts/configmap

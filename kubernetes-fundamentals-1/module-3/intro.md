![Digital Academy Logo](/sylus/courses/kubernetes-fundamentals-1/module-3/assets/digital-academy-logo.png)

Welcome to the Digial Academy's "Kubernetes Fundamentals" series. This is Module 3 - Intro to Pods.

In this lab, we will examine how to run containers in Pods.

Pods are the basic building blocks of Kubernetes.
Pods are *groups of containers with shared namespaces and shared volumes*.

* Pods containers are always co-located on the same host
* Pod containers share a single IP and portspace and communicate via localhost
* Pod containers have access to shared volumes for storage
* Pods are designed to be emphemeral (like cattle, not pets)

In this lab we will explore the following:

## Creating Pods with the command line

Using the command line is an easy way explore pod concepts.
These labs will let you inspsect pod configurations, running containers and networking.

## Creating Pods with manifest files

For production systems, using the command line can be error prone.
In this exercise, we explore file based pod specification and creation.

## Inspecting Pods

Understanding how a pod works will him you debig issues when they arrive.
In this lab we will explore the Pod lifecycle, networking, and configuration.

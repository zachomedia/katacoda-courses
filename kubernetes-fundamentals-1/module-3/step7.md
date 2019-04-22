# IPC Communication

Containers in a Pod share the same IPC namespace, which means they can also communicate with each other using standard inter-process communications such as SystemV semaphores or POSIX shared memory.

Examine the file `./resources/pod-ipc.yaml` in the file explorer.

The first container, producer, creates a standard Linux message queue, writes a number of random messages, and then writes a special exit message. The second container, consumer, opens that same message queue for reading and reads messages until it receives the exit message.

Run the example:

`kubectl create -f ./resources/pod-ipc.yaml`{{execute}}

NOTE: These pods will show a COMPLETED status after running. They are not long lived.

Verify these pods were able to communicate by checking the logs of each container:

`kubectl logs pod-ipc -c producer`{{execute}}

`kubectl logs pod-ipc -c consumer`{{execute}}

Delete the pod when you are done:

`kubectl delete -f ./resources/pod-ipc.yaml`{{execute}}
Let’s verify that the application we deployed in the previous scenario is running. We’ll use the `kubectl get`{{}} command and look for existing Pods:

```
kubectl get pods
```{{exec}}

If no pods are running then it means the interactive environment is still setting up. Please wait a couple of seconds and list the Pods again. You can continue once you see the one Pod running.

Next, to view what containers are inside that Pod and what images are used to build those containers we run the `describe pods`{{}} command:

```
kubectl describe pods
```{{exec}}

We see here details about the Pod’s container: IP address, the ports used and a list of events related to the lifecycle of the Pod.

The output of the `describe`{{}} command is extensive and covers some concepts that we didn’t explain yet, but don’t worry, you can dig deeper later.

*Note: the describe command can be used to get detailed information about most of the kubernetes primitives: node, pods, deployments. The describe output is designed to be human readable, not to be scripted against.*

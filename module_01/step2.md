To view the nodes in the cluster, run the `kubectl get nodes` command:

```
kubectl get nodes
```{{exec}}

Here we see the available nodes (2 in our case). Kubernetes will choose where to deploy our application based on Node available resources.

You can also check the working pods. But at this point nothing would be found.

```
kubectl get pods
```{{exec}}
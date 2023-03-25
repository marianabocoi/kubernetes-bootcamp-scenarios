Let’s deploy our first app on Kubernetes. We need to provide the deployment name and app image location (include the full repository url for images hosted outside Docker hub).

```
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
```{{exec}}

Great! You just deployed your first application by creating a deployment. This performed a few things for you:
- searched for a suitable node where an instance of the application could be run (we have only 1 available node)
- scheduled the application to run on that Node
- configured the cluster to reschedule the instance on a new Node when needed

To list your deployments use the `get deployments`{{}} command:

```
kubectl get deployments
```{{exec}}

We see that there is 1 deployment running a single instance of your app. The instance is running inside a container on your node.

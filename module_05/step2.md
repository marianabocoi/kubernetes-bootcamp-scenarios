First, check that the app is running. To find the exposed IP and Port, run the `describe service`{{}} command:
```
kubectl describe services/kubernetes-bootcamp
```{{exec}}

Create an environment variable called `NODE_IP`{{}} that has the value of the endpoint ip assigned:
```
export NODE_IP=$(kubectl get endpoints/kubernetes -o jsonpath='{.subsets[*].addresses[*].ip}')
```{{exec}}

Create an environment variable called `NODE_PORT`{{}} that has the value of the Node port assigned:
```
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
```{{exec}}

Next, do a `curl`{{}} to the the exposed IP and port:
```
curl $NODE_IP:$NODE_PORT
```{{exec}}

Every time you run the `curl`{{}} command, you will hit a different Pod. Notice that all Pods are running the latest version (v2).

You can also confirm the update by running the `rollout status`{{}} command:
```
kubectl rollout status deployments/kubernetes-bootcamp
```{{exec}}

To view the current image version of the app, run the `describe pods`{{}} command:
```
kubectl describe pods
```{{exec}}

In the `Image`{{}} field of the output, verify that you are running the latest image version (v2).

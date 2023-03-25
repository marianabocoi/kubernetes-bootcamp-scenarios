Let’s check that the Service is load-balancing the traffic. To find out the exposed IP and Port we can use the describe service as we learned in the previous Module:

```
kubectl describe services/kubernetes-bootcamp
```{{exec}}

Create an environment variable called `NODE_IP`{{}} that has the value of the endpoint ip assigned:
```
export NODE_IP=$(kubectl get endpoints/kubernetes -o jsonpath='{.subsets[*].addresses[*].ip}')
```{{exec}}

Create an environment variable called `NODE_PORT`{{}} that has the value of the endpoint port assigned:
```
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
```{{exec}}

Next, we’ll do a `curl`{{}} to the exposed IP and port. Execute the command multiple times:
```
curl $NODE_IP:$NODE_PORT
```{{exec}}

We hit a different Pod with every request. This demonstrates that the load-balancing is working.

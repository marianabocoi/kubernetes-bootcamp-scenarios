Let’s verify that our application is running. We’ll use the `kubectl get`{{}} command and look for existing Pods:

```
kubectl get pods
```{{exec}}

If no pods are running then it means the interactive environment is still reloading its previous state. Please wait a couple of seconds and list the Pods again. You can continue once you see the one Pod running.

Next, let’s list the current Services from our cluster:

```
kubectl get services
```{{exec}}

We do not have services yet.
To create a new service and expose it to external traffic we’ll use the expose command with NodePort as parameter.

```
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
```{{exec}}

Let’s run again the `get services`{{}} command:

```
kubectl get services
```{{exec}}

We have now a running Service called kubernetes-bootcamp. Here we see that the Service received a unique cluster-IP, an internal port and an external-IP (the IP of the Node).

To find out what port was opened externally (by the NodePort option) we’ll run the `describe service`{{}} command:

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

Now we can test that the app is exposed outside of the cluster using `curl`, the IP of the Node and the externally exposed port:
```
curl $NODE_IP:$NODE_PORT
```{{exec}}
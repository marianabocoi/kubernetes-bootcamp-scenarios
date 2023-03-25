The API server will automatically create an endpoint for each pod, based on the pod name, that is also accessible through the proxy.
```
kubectl get pods
```{{exec}}

First we need to get the Pod name, and we'll store in the environment variable POD_NAME:

```
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo "Name of the Pod: $POD_NAME"
```{{exec}}

You can access the Pod through the API by running:

```
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/
```{{exec}}

In order for the new deployment to be accessible without using the Proxy, a Service is required which will be explained in the next modules.

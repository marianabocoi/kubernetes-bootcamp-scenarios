Pods that are running inside Kubernetes are running on a private, isolated network.
By default they are visible from other pods and services within the same kubernetes cluster, but not outside that network.
When we use `kubectl`{{}}, we're interacting through an API endpoint to communicate with our application.

We will cover other options on how to expose your application outside the kubernetes cluster in Module 3.

The `kubectl`{{}} command can create a proxy that will forward communications into the cluster-wide, private network. The proxy can be terminated by pressing control-C and won't show any output while its running. 

Open a second terminal window to run the proxy command.
```
kubectl proxy
```{{exec}}

We now have a connection between our host (the online terminal) and the Kubernetes cluster. The  proxy enables direct access to the API from these terminals.

You can see all those APIs hosted through the proxy endpoint. For example, we can query the version directly through the API using the `curl` command:

```
curl http://localhost:8001/version
```{{exec}}

*Note: Check the top of the terminal. The proxy was run in a new tab (Terminal 2), and the recent commands were executed the original tab (Terminal 1). The proxy still runs in the second tab, and this allowed our curl command to work using `localhost:8001`{{}}.*

**If Port 8001 is not accessible, ensure that the `kubectl proxy` started above is running.**
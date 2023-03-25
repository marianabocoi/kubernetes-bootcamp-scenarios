kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080
kubectl expose deployments/kubernetes-bootcamp --type="NodePort" --port 8080
echo done >> /tmp/background0
echo 'echo ===================================' > startup.sh
echo 'echo Hello and welcome to this scenario!' >> startup.sh
echo 'echo ===================================' >> startup.sh

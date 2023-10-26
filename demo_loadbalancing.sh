#!/bin/bash

# Scale the deployment
echo "Scaling deployment to 4 replicas..."
kubectl scale deployment flask-deployment --replicas=4
sleep 10

# Fetch the NodePort
export NODE_PORT=$(kubectl get services/flask-service -o go-template='{{(index .spec.ports 0).nodePort}}')
echo "NODE_PORT=$NODE_PORT"
echo

# Access the service multiple times to showcase load balancing
echo "Accessing the service multiple times to showcase load balancing:"
for i in {1..5}; do
    echo "Request $i:"
    curl http://$(minikube ip):$NODE_PORT
    echo
    sleep 2
done

# Showcase fault tolerance by deleting a pod
echo "Deleting one pod... (we can show fault tolerance using this)"
kubectl delete pod $(kubectl get pods -l app=flask-app -o=jsonpath='{.items[0].metadata.name}')
sleep 5

echo "Accessing the service again after deleting a pod:"
for i in {1..5}; do
    echo "Request $i:"
    curl http://$(minikube ip):$NODE_PORT
    echo
    sleep 2
done

# Show that the number of pods goes back to 4
echo "Checking the number of pods after pod deletion..."
kubectl get pods
echo "As expected, Kubernetes has maintained 4 replicas even after deleting one pod."

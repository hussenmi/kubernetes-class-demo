#!/bin/bash

echo "Building the Docker image for v3..."
# docker build -t my-flask-app:v3 .
docker build --no-cache -t my-flask-app:v3 .

echo "Simulating a buggy update to v3..."
kubectl set image deployment/flask-deployment flask-app-container=my-flask-app:v3
sleep 15  # Give some time for the update to stabilize

echo "Accessing the buggy version..."
minikube service flask-service --url | xargs curl
echo

echo "Buggy update to v3 complete!"

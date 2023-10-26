#!/bin/bash

# Set up Minikube's Docker environment
eval $(minikube docker-env)

echo "Building the Docker image for v2..."
docker build --no-cache -t my-flask-app:v2 .

echo "Updating the application to v2..."
kubectl set image deployment/flask-deployment flask-app-container=my-flask-app:v2
sleep 10  # Give some time for the update to stabilize

echo "Accessing the updated service..."
minikube service flask-service --url
echo

echo "Update to v2 complete!"

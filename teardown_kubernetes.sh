#!/bin/bash

# Delete the Kubernetes deployment and service
echo "Deleting Kubernetes deployment and service..."
kubectl delete deployment flask-deployment
kubectl delete service flask-service

# Optionally: Clean up Docker images
# This step is optional and depends on whether you want to remove the Docker image as well
# echo "Removing Docker image..."
# docker rmi my-flask-app:latest

echo "Teardown complete!"

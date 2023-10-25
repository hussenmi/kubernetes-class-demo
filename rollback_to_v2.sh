#!/bin/bash

echo "Rolling back to v2..."
kubectl rollout undo deployment/flask-deployment
sleep 15  # Give some time for the rollback to stabilize

echo "Accessing the rolled back service..."
minikube service flask-service --url | xargs curl
echo

echo "Rollback to v2 complete!"

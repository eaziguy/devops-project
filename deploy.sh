#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
# We use 'docker' without 'sudo' now
docker stop my-app || true
docker rm my-app || true

echo "Building new image..."
docker build -t my-devops-app .

echo "Running new container..."
docker run -d -p 80:80 --name my-app my-devops-app

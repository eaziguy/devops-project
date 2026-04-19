#!/bin/bash

# Force the path so GitHub can see it
export PATH=$PATH:/usr/bin

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
docker stop my-app || true
docker rm my-app || true

echo "Building new image..."
docker build -t my-devops-app .

echo "Running new container..."
docker run -d -p 80:80 --name my-app my-devops-app

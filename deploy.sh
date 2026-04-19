#!/bin/bash

echo "Pulling latest code..."
git pull

echo "Stopping old container..."
sudo docker stop my-app || true
sudo docker rm my-app || true

echo "Building new image..."
sudo docker build -t my-devops-app .

echo "Running new container..."
sudo docker run -d -p 80:80 --name my-app my-devops-app

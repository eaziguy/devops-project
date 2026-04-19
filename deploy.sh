#!/bin/bash
# Force the tool map
export PATH=$PATH:/usr/bin:/usr/local/bin

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
# Using sudo here ensures the daemon connection never fails
sudo docker stop my-app || true
sudo docker rm my-app || true

echo "Building and Running..."
sudo docker build -t my-devops-app .
sudo docker run -d -p 80:80 --name my-app my-devops-app

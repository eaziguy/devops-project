#!/bin/bash

# Force the standard path
export PATH=$PATH:/usr/bin

echo "Pulling latest code..."
git pull origin main

echo "Cleaning up old container..."
docker stop my-app || true
docker rm my-app || true

echo "Building and Running..."
docker build -t my-devops-app .
docker run -d -p 80:80 --name my-app my-devops-app

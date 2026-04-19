#!/bin/bash
# Force the script to look in every possible folder for Docker
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin

echo "Pulling latest code..."
git pull origin main

echo "Cleaning up..."
docker stop my-app || true
docker rm my-app || true

echo "Building and Running..."
docker build -t my-devops-app .
docker run -d -p 80:80 --name my-app my-devops-app

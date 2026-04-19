#!/bin/bash
# 1. Manually add all common tool folders to the PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin

echo "Pulling latest code..."
git pull origin main

echo "Cleaning up..."
# Using full paths just to be extra safe
/usr/bin/docker stop my-app || /snap/bin/docker stop my-app || true
/usr/bin/docker rm my-app || /snap/bin/docker rm my-app || true

echo "Building and Running..."
# If the above links worked, standard 'docker' will work now
docker build -t my-devops-app .
docker run -d -p 80:80 --name my-app my-devops-app


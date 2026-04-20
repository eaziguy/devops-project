#!/bin/bash

echo "Pulling latest code..."
git pull 

echo "Stopping old container..."
sudo docker compose down

echo "Starting with Docker Compose"
sudo docker compose up -d --build

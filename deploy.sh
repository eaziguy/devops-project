#!/bin/bash

echo "Updating server...."
sudo apt update -y

echo "installing nginx..."
sudo apt install nginx -y

echo "Starting nginx...."
sudo systemctl start nginx

echo "Deploying website....."
sudo bash -c 'cat > /var/www/html/indexc.nginx-debian.html <<EOF
<h1> CI/CD WORkING </h1>
<p1>This updated automatically </p>
EOF'

echo "Done!"

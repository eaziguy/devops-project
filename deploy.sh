#!/bin/bash

echo "Updating server...."
sudo apt update -y

echo "installing nginx..."
sudo apt install nginx -y

echo "Starting nginx...."
sudo systemctl start nginx

echo "Deploying website....."
sudo bash -c 'cat > /var/www/html/indexc.nginx-debian.html <<EOF
<h1> Automated Devops Site </h1>
<p1>This was deployed using aa bash script </p>
EOF'

echo "Done!"

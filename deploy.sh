#!/bin/bash

echo "Updating server...."
sudo apt update -y

echo "Installing nginx..."
sudo apt install nginx -y

echo "Starting nginx...."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Deploying website...."
# This line deletes the old file so the new one can take over
sudo rm -f /var/www/html/index.html /var/www/html/index.nginx-debian.html

# This creates the CORRECT file name
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<h1> CI/CD WORKING </h1>
<p> This updated automatically via GitHub Actions Actively working baby! </p>
EOF'

echo "Done!"

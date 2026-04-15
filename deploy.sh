#!/bin/bash

echo "Deploying website..."

sudo rm -f /var/www/html/index.html /var/www/html/index.nginx-debian.html <<EOF
<h1> CI/CD WORKING </h1>
<p> This updated automatically via CI/CD!</p>
EOF'

# Give the web server permission to read the folder
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

echo "Done!"

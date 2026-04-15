#!/bin/bash

echo "Deploying website..."

sudo rm -f /var/www/html/index.html /var/www/html/index.nginx-debian.html <<EOF
<h1> CI/CD WORKING </h1>
<p> This updated automatically via CI/CD!</p>
EOF'

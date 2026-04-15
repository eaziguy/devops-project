#!/bin/bash

# 1. Clean out the old files completely
sudo rm -rf /var/www/html/*

# 2. Create the fresh index.html file (Note the -c to bypass permissions)
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<body>
    <h1 style="color: green;"> MY DEVOPS PROJECT</h1>
    <p>This is Deployed automatically </p>
</body>
</html>
EOF'

# 3. Fix Permissions (The "Unlocking" step)
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# 4. Restart Nginx to make sure it sees the change
sudo systemctl restart nginx

echo "Deployment Successful!"

#!/bin/bash

# 1. Clean out the old files completely
sudo rm -rf /var/www/html/*

# 2. Create the fresh index.html file
sudo bash -c 'cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<body>
    <h1 style="color: green;"> MY DEVOPS PROJECT</h1>
    <p>This is Deployed automatically </p>
</body>
</html>
EOF'

# 3. Fix Permissions
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# 4. Restart Nginx
sudo systemctl restart nginx

# 5. Backup to S3
echo "uploading backup to s3....."
aws s3 cp /var/www/html/index.html s3://my-devops-bucket-200123/

echo "Deployment Successful!"

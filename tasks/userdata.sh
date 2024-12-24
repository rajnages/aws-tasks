#!/bin/bash

# Update the package index
sudo apt-get update

# Install NGINX
sudo apt-get install -y nginx

# Start NGINX service
sudo systemctl start nginx
sudo systemctl enable nginx

# Get the instance's availability zone using IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create a simple HTML page
echo "<html>
<head>
  <title>Welcome to NGINX</title>
</head>
<body>
  <h1>Hello from NGINX behind ELB!</h1>
  <p>Availability Zone: $AZ</p>
</body>
</html>" | sudo tee /var/www/html/index.html

# Allow NGINX to start on boot
sudo systemctl enable nginx

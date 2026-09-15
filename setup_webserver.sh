#!/bin/bash
# Automated Apache Web Server Setup Script

dnf install -y httpd mod_ssl
systemctl enable --now httpd

mkdir -p /var/www/site1.local/html
mkdir -p /var/www/site2.local/html
echo "<h1>Site 1 - Welcome</h1>" /var/www/site1.local/html/index.html
echo "<h1>Site 2 - Welcome</h1>" /var/www/site2.local/html/index.html

firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload

systemctl restart httpd
echo "Web server setup complete!"

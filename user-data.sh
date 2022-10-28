#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1> VPC, EC2, SECURITY GROUPS</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>SUCCEED!</h1> </body></html>' | sudo tee /var/www/html/app/index.html
sudo curl https://google.com -o /var/www/html/app/metadata.html
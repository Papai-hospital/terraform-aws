#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo yum install git -y
sudo amazon-linux-extras install nginx1

# sudo service --status-all
# sudo service docker start
# docker run -p 8080:80 nginx
# docker build -t papai-server .
# docker run -d -p 3000:3000 --name papai-container papai-server
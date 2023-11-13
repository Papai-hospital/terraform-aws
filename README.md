# terraform-aws

AWS EC2 instance deployment via Terraform

# Adding public key from ec2 or amy vps to your github for ssh

1. make a new public on local host (generate public key under ~/.ssh)

cd
ssh-keygen -t rsa -b 1024

2. copy the output of the following cat.

cat ~/.ssh/id_rsa.pub

3. copy the result and add new ssh key in https://github.com/settings/keys

# Setup nginx

In ec2, install nginx with
sudo amazon-linux-extras install nginx1

Then edit config file with:
sudo nano /etc/nginx/nginx.conf

By editing the server tag:
server {
listen 80 default_server;
listen [::]:80 default_server;
server_name localhost;
root /usr/share/nginx/html;
location / {
proxy_pass http://127.0.0.1:3000;
}
}

(exit by pressing Ctr+X)

Then restart nginx
sudo service nginx restart

and finally setup nginx to restart
sudo chkconfig nginx on

# Destroy

terraform plan -destroy

terraform apply -destroy

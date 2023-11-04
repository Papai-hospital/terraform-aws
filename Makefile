include .env
deploy:
	terraform apply
ec2login:
	ssh ec2-user@${EC2_HOST}
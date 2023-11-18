-include .env
init:
	terraform init
plan:
	terraform plan
apply:
	terraform apply	
destroy:
	terraform destroy
output:
	terraform output > .env
dont-use-this:
	terraform apply -auto-approve
	terraform output > .env
ec2login:
	ssh ec2-user@${EC2_HOST}
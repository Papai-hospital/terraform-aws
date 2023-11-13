output "ec2_public_ip" {
  value = module.papai-app-server.instance.public_ip
}
output "s3_instance" {
  value = module.papai-s3-profilePic.bucket
}

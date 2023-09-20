output "ec2_public_ip" {
  value = module.papai-app-server.instance.public_ip
}

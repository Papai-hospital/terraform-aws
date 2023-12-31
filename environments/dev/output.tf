output "ec2_public_ip" {
  value = module.papai-app-server.instance.public_ip
}
output "s3_instance_arn" {
  value = module.papai-s3-profilePic.bucket.arn
}
output "s3_instance_name" {
  value = module.papai-s3-profilePic.bucket.bucket
}
output "iam" {
  value = module.papai-iam.iam
}


output "EC2_HOST" {
  value       = module.papai-app-server.instance.public_ip
  description = "value of the public ip of the ec2 instance"
}
output "s3_instance_arn" {
  value       = module.papai-s3-profilePic.bucket.arn
  description = "value of the s3 arn"
}
output "AWS_S3_BUCKET" {
  value       = module.papai-s3-profilePic.bucket.bucket
  description = "value of the s3 bucket name"
}
output "IAM_ARN" {
  value       = module.papai-iam.iam.arn
  description = "value of the iam arn"
}
output "AWS_REGION" {
  value       = module.papai-s3-profilePic.bucket.region
  description = "region"
}

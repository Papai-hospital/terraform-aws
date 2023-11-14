resource "aws_s3_bucket" "profilePic" {
  bucket = "papai-image-bucket-${var.env_prefix}"
  tags = {
    Name = "${var.env_prefix}-image-bucket"
  }
  force_destroy = true //use this in dev only
}

//ACCESS-CONTROL
resource "aws_s3_bucket_ownership_controls" "profilePic" {
  bucket = aws_s3_bucket.profilePic.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "profilePic" {
  bucket = aws_s3_bucket.profilePic.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  # restrict_public_buckets = false
}

# resource "aws_s3_bucket_acl" "profilePic" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.profilePic,
#     aws_s3_bucket_public_access_block.profilePic,
#   ]

#   bucket = aws_s3_bucket.profilePic.id
#   acl    = "public-read"
# }

//CORS
resource "aws_s3_bucket_cors_configuration" "profilePic" {
  bucket = aws_s3_bucket.profilePic.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = "86400"
  }
}



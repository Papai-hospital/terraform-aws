//create policy for s3 bucket
resource "aws_iam_policy" "bucket-policy" {
  name        = "${var.env_prefix}-papai-app-bucket-policy"
  path        = "/"
  description = "Allow "
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" : "arn:aws:logs:*:*:*",
        "Effect" : "Allow"
      },
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          # "s3:PutObject",
          # "s3:GetObject",
          # "s3:ListBucket",
          # "s3:DeleteObject"
          "s3:*"
        ],
        "Resource" : ["arn:aws:s3:::${var.bucket_name}/*"
          # "arn:aws:s3:::${var.bucket_name}",
        ]
      }
    ]
  })
}

//create iam role
resource "aws_iam_role" "papai-app-role" {
  name = "${var.env_prefix}-papai-app-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

//attach policy to role
resource "aws_iam_role_policy_attachment" "papai-bucket-policy" {
  role       = aws_iam_role.papai-app-role.name
  policy_arn = aws_iam_policy.bucket-policy.arn
}

//iam instance profile
resource "aws_iam_instance_profile" "papai-app-profile" {
  name = "${var.env_prefix}-papai-app-profile"
  role = aws_iam_role.papai-app-role.name
}

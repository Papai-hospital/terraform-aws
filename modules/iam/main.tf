resource "aws_iam_role" "papai-app-role" {
  name = "${var.env_prefix}-papai-app-role"
  assume_role_policy = jsonencode({
    Version = "2023-11-14"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }

    ]
  })
}

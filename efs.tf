# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_efs_file_system" "foo" {
#   creation_token = "my-product"
#   encrypted = true

#   tags = {
#     Name = "MyProduct"
#   }
# }


# resource "aws_efs_file_system_policy" "policy" {
#   file_system_id = aws_efs_file_system.foo.id

#   policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Id": "ExamplePolicy01",
#     "Statement": [
#         {
#             "Sid": "ExampleStatement01",
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": "*"
#             },
#             "Resource": "${aws_efs_file_system.foo.arn}",
#             "Action": [
#                 "elasticfilesystem:ClientMount",
#                 "elasticfilesystem:ClientWrite"
#             ],
#             "Condition": {
#                 "Bool": {
#                     "aws:SecureTransport": "true"
#                 }
#             }
#         }
#     ]
# }
# POLICY
# }

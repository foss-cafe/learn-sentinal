resource "aws_imagebuilder_component" "example" {
  name     = "example"
  platform = "Linux"
  version  = "1.0.0"
  kms_key_id = "arn:aws:kms:ap-south-1:549942532493:key/f03fe8d0-8951-41eb-9f39-0ab438cd9002"
  tags = var.tags
}


resource "aws_imagebuilder_distribution_configuration" "example" {
  name = "example"
  kms_key_id = "arn:aws:kms:ap-south-1:549942532493:key/f03fe8d0-8951-41eb-9f39-0ab438cd9002"
  distribution {
    region = "us-east-1"
  }
  tags = var.tags
}

resource "aws_imagebuilder_component" "example" {
  name       = "example"
  platform   = "Linux"
  version    = "1.0.0"
  kms_key_id = "arn:aws:kms:ap-south-1:549942532493:key/f03fe8d0-8951-41eb-9f39-0ab438cd9002"
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
}


resource "aws_imagebuilder_distribution_configuration" "example" {
  name = "example"

  distribution {
    ami_distribution_configuration {
      ami_tags = {
        CostCenter = "IT"
      }

      name = "example-{{ imagebuilder:buildDate }}"

      launch_permission {
        user_ids = ["123456789012"]
      }
    }

    region = "us-east-1"
  }
}
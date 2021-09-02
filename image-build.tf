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
    region = "ap-south-1"
    # ami_distribution_configuration {
    #   kms_key_id = "arn:aws:kms:ap-south-1:549942532493:key/f03fe8d0-8951-41eb-9f39-0ab438cd9002"
    #   ami_tags = {
    #     CostCenter = "IT"
    #   }
    #   name = "example-{{ imagebuilder:buildDate }}"
    # }
    
  }

  # kms_key_id = "arn:aws:kms:ap-south-1:549942532493:key/f03fe8d0-8951-41eb-9f39-0ab438cd9002" 
}

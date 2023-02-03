resource "aws_ec2_transit_gateway" "TGW1" {
  description = "TGW"

  tags = {
    Name = "AMI-Network-us-east-1-TGW"
  }
}


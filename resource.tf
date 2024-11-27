# This is a resource file were we will provide what services we are trying to impement using terraform
# This file is used to define the infrastructure as code
# We will use this file to define the AWS resources we want to create
# Currently in our redmifile we have deifined that is : 
# Define an aws data source to query and retervie the most recent ubuntu ami using data source

#######################################################################################
# Define an aws ec2 instance using the data source to get the most recent ubuntu ami
# Define an aws key pair to use for the ec2 instance
# Define an aws security group to use for the ec2 instance
# Define an aws vpc to use for the ec2 instance
# Define an aws subnet to use for the ec2 instance
# Define an aws route table to use for the ec2 instance
# Define an aws internet gateway to use for the ec2 instance
# Define an aws eip to use for the ec2 instance
# Define an aws ebs volume to use for the ec2 instance

#######################################################################################

# Define an aws ec2 instance using the data source to get the most recent ubuntu ami
# Before creating an ec2-instance we need to first start creating the key-pair for the instance you gona create
resource "aws_key_pair" "DataSource-KEYPAIR" {
  key_name = "DataSource-KEYPAIR"
  # NOTE : We dont have a key pair locally,
  # When creating an AWS EC2 instance using Terraform, 
  # The aws_key_pair resource requires a public key
  # Because it needs to associate an SSH key pair with your EC2 instance.
  public_key = file("C:/Users/ravsekar/.ssh/id_ed25519.pub")
}
# This will display the id of newly generated key pair
output "aws_dateSource-keypair" {
  value = aws_key_pair.DataSource-KEYPAIR.key_name
}
# This will display new generated fingerprint (key) of the key value/
output "aws_dateSource-keypair-fingerprint" {
  value = aws_key_pair.DataSource-KEYPAIR.fingerprint
}

# Before creating an ec2-instance we need to create one data source for ami 
# for this you can refer with registery.terraform link 
/* data "aws_ami" "AMI-ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name = ""
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd"]
  }
  filter {
  name   = "virtualization-type"
  values = ["hvm"]
  }

}
output "AMI-ubuntu" {
  value = data.aws_ami.AMI-ubuntu.id
  
} */

# Fetching aws account details though data source

data "aws_caller_identity" "aws_caller_identity-DataSource" {
  provider = aws

}
output "aws_caller_identity-DataSource-output" {
  value = data.aws_caller_identity.aws_caller_identity-DataSource
}

# Fetching region details through data-source
data "aws_region" "Region-details" {
  provider = aws
}
output "aws-region-output" {
  value = data.aws_region.Region-details

}

# Fetching vpc-data through data source

data "aws_vpc" "Fetching-VPC-DATA" {
  provider = aws
  tags = {
    ENV = "PRE-PROD"
  }
  
}
output "aws_vpc-data-output" {
  value = data.aws_vpc.Fetching-VPC-DATA
}
output "aws_vpc-data-output-id" {
  value = data.aws_vpc.Fetching-VPC-DATA.id
}

data "aws_availability_zones" "aws_availability_zone-data-Fetching" {
  provider = aws
  state = "available"
  
}
output "aws_availability_zone-output" {
  value = data.aws_availability_zones.aws_availability_zone-data-Fetching.id 
}



# For this we need to create one ec2-instance 
/*resource "aws_instance" "dateSource-instance" {
  ami = ""
  # Here is the tags block were we define name of the instance and rest
  tags = {
    name = "aws-DataSource-instance-terraform"
    Enivornment = "Developnemt"
}
  # Here we are calling the key using keyname parameter
  key_name      = aws_key_pair.DataSource-KEYPAIR.id
  instance_type = "t2.micro"
}
# THis will display the aws instance output part
output "aws_instance-output" {
  value = aws_instance.dateSource-instance.id

} */


# Creating a new bucket with the resource 
resource "aws_s3_bucket" "New_dummy-bucket" {
  bucket = "dummy-bucket-testing"
}
output "s3-bucket-output" {
  value = aws_s3_bucket.New_dummy-bucket
  
}
# Creating a policy for the bucket which we have been created above
resource "aws_s3_bucket_policy" "aws_s3_bucket_policy" {
  bucket = aws_s3_bucket.New_dummy-bucket.id

  policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid       = "PublicReadGetObject"
          Effect    = "Allow"
          Principal = "*"
          Action    = "s3:GetObject"
          Resource = "${aws_s3_bucket.New_dummy-bucket.arn}/*"
        }
        ]
  }
  )
}
output "aws_s3_bucket-policy-output" {
  value = aws_s3_bucket_policy.aws_s3_bucket_policy.id
}

# now defiying the data source to fetch the policy from the above bucket policy 
data "aws_iam_policy_document" "polciy-access-docunment" {
  statement {
    sid       = "AllowAllActions"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.New_dummy-bucket.arn}/*"]
    }
  
}
output "aws_iam_bucket_policy-output" {
  value = data.aws_iam_policy_document.polciy-access-docunment
}
# This is differnt policy in data source
data "aws_s3_bucket_policy" "accessing_bucket-policy" {
  bucket = aws_s3_bucket.New_dummy-bucket.id
}
output "aws_s3_bucket_polciy-output" {
  value = data.aws_s3_bucket_policy.accessing_bucket-policy
  
}



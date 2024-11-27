# In this provider we define which cloud this terraform need to access

terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=1.0.0"
    }
  }
}
# THis is a block were we define in which regaion this need to access
provider "aws" {
  region = "us-east-2"

}
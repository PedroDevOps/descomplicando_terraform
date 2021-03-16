provider "aws" {
  region  = "us-east-2"
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "descomplicando-terraform-pedro-bucket-01"
    key    = "terraform-test.tfstate"
    region = "us-east-2"
  }
}

module "ec2" {
  source                  = "git@github.com:PedroDevOps/descomplicando_terraform_module.git?ref=v0.0"
  app_name                = "ec2_app"
  instance_type           = "t2.micro"
}

output "ip_address_ec2" {
  value = module.ec2.ip_address
}
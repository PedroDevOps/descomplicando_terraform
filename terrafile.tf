# Esse arquivo faz a chamada do módulo que criar ec2 na AWS passando parametros
# O arquivo atual possui mais inteligencia do negócio enquanto o módulo é mais genérico
# O módulo pode ser abstraído como uma classe e nesse arquivo instanciamos o objeto

#Provider que será utilizado será a AWS
provider "aws" {
  region  = "us-east-2"
  version = "~> 3.0"
}

# Se quiser colocar o state em um bucket s3 da AWS descomente o bloco a seguir
/*terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "descomplicando-terraform-pedro-bucket-01"
    key    = "terraform-test.tfstate"
    region = "us-east-2"
  }
}*/

# Módulo que cria instancias ec2 na AWS
# Utilizamos um for_each nessa chamada para forçar a execução de quantas vezes for necessária
module "ec2" {
  source                  = "git@github.com:PedroDevOps/descomplicando_terraform_module.git?ref=v0.3"
  app_name                = each.value.app_name
  instance_type           = each.value.instance_type
  for_each                = var.projeto
}

# Imprimi o Ip Público da Instancia criada
output "ip_address_ec2" {
  value = values(module.ec2)[*].ip_address
}
variable "projeto" {
  description = "Mapa de Projetos"
  type = "map"

  default = {
    projeto1 = {
      instance_type = "t2.micro"
      app_name = "projeto1"
    },
    projeto2 = {
      instance_type = "t3.medium"
      app_name = "projeto2"
    }
  }
}
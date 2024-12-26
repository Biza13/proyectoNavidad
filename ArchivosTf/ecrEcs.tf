#creamos el repositorio ecr
resource "aws_ecr_repository" "repositorio_ecr" {
  name = var.ecr

  tags = {
    "Name"        = "repositorio"
    "Environment" = "Production"
  }
}
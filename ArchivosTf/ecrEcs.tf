#creamos el repositorio ecr
resource "aws_ecr_repository" "repositorio_ecr" {
  name = var.ecr

  tags = {
    "Name"        = "repositorio"
    "Environment" = "Production"
  }
}

#definición de la tarea de ecs
resource "aws_ecs_task_definition" "apache_tarea" {

  #familia a la que pertenece la tarea
  family                = "apache-task"

  #al ser academy nuestro role es labrole
  execution_role_arn    = aws_iam_role.labrole.arn 
  task_role_arn         = aws_iam_role.labrole.arn  

  # Modo de red para Fargate
  network_mode          = "awsvpc"  
  requires_compatibilities = ["FARGATE"]
  
  container_definitions = jsonencode([
    { # Primer contenedor (Apache, para la página web)
      name      = "apache-container"
      image     = "${aws_ecr_repository.repositorio_ecr.repository_url}:img-apachenodenpm"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    },

    { # Segundo contenedor (API JSON)
      name      = "json-api-container"
      image     = ""  # Imagen base de Node.js (HAY QUE CAMBIARLA)
      essential = true 
      portMappings = [
        {
          containerPort = 3000  # Puerto donde se expone el primer archivo JSON (usuarios.json)
          hostPort      = 3000
          protocol      = "tcp"
        },
        {
          containerPort = 3001  # Puerto donde se expone el segundo archivo JSON (ales.json)
          hostPort      = 3001
          protocol      = "tcp"
        },
        {
          containerPort = 3002  # Puerto donde se expone el tercer archivo JSON (stouts.json)
          hostPort      = 3002
          protocol      = "tcp"
        }
      ]
    }

  ])
}
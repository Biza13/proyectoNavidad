variable "vpc" {
    description = "rango de vpc"
    type = string
}

variable "region" {
  description = "AWS Region"
  type = string
}

variable "cidrSubredPublica"{
    description = "Rango de ips de la subred pública"
    type = string
}

variable "cidrSubredPrivada"{
    description = "Rango de ips de la subred privada"
    type = string
}

variable "ecs_cluster_nombre"{
    description = "Nombre del clustes ecs"
    type = string
}

variable "s3"{
  description = "Nombre del bucket s3"
  type = string
}

variable "ecr"{
    description = "nombre de la ecr"
    type = string
}
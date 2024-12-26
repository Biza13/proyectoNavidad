output "s3" {
  value = aws_s3_bucket.s3.id
}

output "ecr_repository_uri_url" {
  value = aws_ecr_repository.repositorio_ecr.repository_url
}
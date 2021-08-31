# arn - Full ARN of the repository.
# registry_id - The registry ID where the repository was created.
# repository_url - The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName).
# tags_all - A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block.
output "ecr_repository_arn" {
  description = "ARN"
  value       = aws_ecr_repository.containers.arn
}

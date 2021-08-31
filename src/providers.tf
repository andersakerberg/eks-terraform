provider "aws" {
  region = var.aws.region
}

provider "kubernetes" {
  host                   = module.cluster.cluster_endpoint
  cluster_ca_certificate = base64decode(module.cluster.cluster_ca_data)
  token                  = module.cluster.cluster_api_token
}

module "cluster" {
  source = "./modules/cluster"
  aws    = var.aws
}

module "namespace" {
  source = "./modules/namespace"
  aws    = var.aws
  depends_on = [
    module.cluster
  ]
}

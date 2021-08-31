module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.aws.eks.name
  cluster_version = "1.21"
  subnets         = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  worker_groups_launch_template = [
    {
      name                    = "spot-1"
      override_instance_types = ["m5.large", "m5d.large"]
      spot_instance_pools     = 1
      asg_max_size            = 1
      asg_desired_capacity    = 1
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      public_ip               = true
    },
  ]
}

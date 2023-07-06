module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.22"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = false

  vpc_id     = data.aws_vpc.vpc.id
  subnet_ids = var.private_subnets

  eks_managed_node_groups = {
    autorizador-dev = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3a.large"]
      capacity_type  = "SPOT"
      ami_id         = "ami-0756133502218d50f"

      use_custom_launch_template = false
      ebs_optimized              = true

      subnet_ids = var.private_subnets

      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 50
            volume_type           = "gp3"
            iops                  = 3000
            throughput            = 150
            encrypted             = true
            kms_key_id            = aws_kms_key.kms_to_nodes_eks.arn
            delete_on_termination = true
          }
        }
      }
    }
  }

  cluster_addons = {
    coredns = {
      most_recent       = true
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent       = true
      resolve_conflicts = "OVERWRITE"
    }
  }

  manage_aws_auth_configmap = true
  create_aws_auth_configmap = false

  aws_auth_users    = var.aws_auth_users
  aws_auth_accounts = var.aws_auth_accounts

  create_iam_role      = true
  iam_role_name        = "eks-nodes-autorizador-role"
  iam_role_description = "EKS managed node group complete example role"

  tags = local.tags
}
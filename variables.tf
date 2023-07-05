variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-autorizador-dev"
}

variable "aws_auth_roles" {
  default = [
    {
      rolearn  = "arn:aws:iam::992627875852:role/aws-service-role/eks-nodegroup.amazonaws.com/AWSServiceRoleForAmazonEKSNodegroup"
      username = "role"
      groups   = ["system:masters"]
    },
  ]
}

variable "aws_auth_users" {
  default = [
    {
      userarn  = "arn:aws:iam::992627875852:user/josias.figueira"
      username = "josias.figueira"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/miguel.valim"
      username = "miguel.valim"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/eks.deploy"
      username = "eks.deploy"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/helio.santos"
      username = "helio.santos"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/diego.devskin"
      username = "diego.devskin"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/anderson.devskin"
      username = "anderson.devskin"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::992627875852:user/gabriel.devskin"
      username = "gabriel.devskin"
      groups   = ["system:masters"]
    }
  ]
}

variable "aws_auth_accounts" {
  type    = list(string)
  default = []
}

variable "private_subnets" {
  type    = list(string)
  default = ["subnet-0ba107fef3cea8ceb", "subnet-0a1fe652feb368b3f", "subnet-0101a23d702719981"]
}

variable "cidr_block" {
  type    = list(string)
  default = ["192.168.22.0/23", "192.168.64.0/18"]
}

variable "registry_server_sb" {
  type    = string
  default = "socialbank.azurecr.io"
}
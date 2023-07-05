resource "aws_security_group_rule" "allow_network_office" {
  description       = "Allow Network Office SB"
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.160.0.0/16", "10.150.0.0/16"]
  security_group_id = module.eks.cluster_primary_security_group_id
}

resource "aws_security_group_rule" "allow_Jenkins" {
  description               = "Allow Jenkins SB"
  type                      = "ingress"
  from_port                 = 0
  to_port                   = 0
  protocol                  = "-1"
  source_security_group_id  = data.aws_security_group.sg_jenkins.id
  security_group_id         = module.eks.cluster_primary_security_group_id
}
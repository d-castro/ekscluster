data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["commons"]
  }
}

data "aws_security_group" "sg_firewall" {
  filter {
    name   = "tag:Name"
    values = ["Firewall-to-commons"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_secretsmanager_secret_version" "socialarc_password" {
  secret_id = "socialarc_password"
  depends_on = [ aws_secretsmanager_secret.socialarc_password ]
}

data "aws_security_group" "sg_jenkins" {
  filter {
    name   = "tag:Name"
    values = ["Jenkins Lab"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
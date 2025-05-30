resource "aws_network_acl" "public_nacl" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Public Subnet NACL"
  }
}

resource "aws_network_acl_rule" "deny_ssh" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "deny"
  cidr_block     = var.my_ip
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow_all" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 200
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_association" "public_subnet" {
  network_acl_id = aws_network_acl.public_nacl.id
  subnet_id      = var.subnet_id
}

resource "aws_subnet" "my_subnet" {
  vpc_id = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}



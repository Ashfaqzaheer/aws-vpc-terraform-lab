variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "my_ip" {
  description = "Your IP in CIDR notation for SSH access"
  type        = string
}

variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  type    = list(string)
  default = ["10.1.1.0/24"]
}

variable "public_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}


variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "name" {
  type        = string
  description = "Name tag for the VPC"
}


variable "my_ip" {
  type = string
}

# Assume module.vpc and module.subnet are declared elsewhere

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "vpc2_name" {
  default = "vpc2"
}

# OPTIONAL for peering
variable "peer_vpc_id" {}
variable "peer_vpc_cidr" {}
variable "peer_route_table_id" {}





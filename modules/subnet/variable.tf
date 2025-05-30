variable "vpc_id" {
  type = string
}

variable "public_cidr" {
  type = list(string)
}

variable "private_cidr" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "subnet_cidr" {
  type = string
}
variable "vpc_id" {
  description = "ID of the VPC to enable flow logs for"
  type        = string
}

variable "retention_in_days" {
  description = "Retention period for CloudWatch Logs"
  type        = number
  default     = 7
}

variable "subnet_id" {
  description = "ID of the subnet for flow logs (if applicable)"
  type        = string
  default     = null
}

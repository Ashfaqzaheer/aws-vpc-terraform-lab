resource "aws_cloudwatch_log_group" "vpc_flow_log_group" {
  name              = "/aws/vpc/flow-logs/${var.vpc_id}"
  retention_in_days = 14
}

resource "aws_iam_role" "flow_logs_role" {
  name = "vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "flow_logs_policy_attach" {
  role       = aws_iam_role.flow_logs_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_flow_log" "vpc_flow_log" {
  vpc_id             = var.vpc_id
  iam_role_arn       = aws_iam_role.flow_logs_role.arn
  log_destination    = aws_cloudwatch_log_group.vpc_flow_log_group.arn
  traffic_type       = "ALL"
  log_destination_type = "cloud-watch-logs"
}


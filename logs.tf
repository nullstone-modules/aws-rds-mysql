locals {
  // Log types exported to CloudWatch. RDS creates a log group per type at
  // /aws/rds/instance/<identifier>/<log-type>.
  log_exports = ["error", "general", "slowquery"]
}

resource "aws_cloudwatch_log_group" "this" {
  for_each = toset(local.log_exports)

  name              = "/aws/rds/instance/${local.resource_name}/${each.key}"
  retention_in_days = var.log_retention
  tags              = local.tags
}

resource "aws_iam_user" "log_reader" {
  name = "log-reader-${local.resource_name}"
  tags = local.tags
}

resource "aws_iam_access_key" "log_reader" {
  user = aws_iam_user.log_reader.name
}

resource "aws_iam_user_policy" "log_reader" {
  name   = "AllowReadLogsAndMetrics"
  user   = aws_iam_user.log_reader.name
  policy = data.aws_iam_policy_document.log_reader.json
}

data "aws_iam_policy_document" "log_reader" {
  statement {
    sid    = "AllowReadLogs"
    effect = "Allow"

    actions = [
      "logs:Get*",
      "logs:List*",
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:TestMetricFilter",
      "logs:Filter*"
    ]

    resources = [for group in aws_cloudwatch_log_group.this : group.arn]
  }

  statement {
    sid       = "AllowGetMetrics"
    effect    = "Allow"
    resources = ["*"] // Metrics cannot be restricted by resource

    actions = [
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:ListMetrics",
    ]
  }
}

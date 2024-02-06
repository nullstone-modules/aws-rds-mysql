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

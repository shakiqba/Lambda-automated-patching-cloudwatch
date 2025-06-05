provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile  # Optional: Remove this line if you're using env vars instead of AWS CLI profiles
}

resource "aws_cloudwatch_dashboard" "lambda_dashboard" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 24,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/Lambda", "Errors", "FunctionName", var.lambda_function_name ]
          ],
          view     = "timeSeries",
          stacked  = false,
          region   = var.aws_region,
          title    = "Lambda Function Errors"
        }
      }
    ]
  })
}


resource "aws_cloudwatch_metric_alarm" "lambda_error_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 120
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Alarm for Lambda errors >= 1"
  treat_missing_data  = "missing"

  dimensions = {
    FunctionName = var.lambda_function_name
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}

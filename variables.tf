variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-gov-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name to use for authentication"
  type        = string
  default     = "default"
}

variable "dashboard_name" {
  description = "Name of the CloudWatch dashboard"
  type        = string
}

variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function to monitor"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the existing SNS topic for alarm notifications"
  type        = string
}

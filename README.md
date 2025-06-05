# Lambda-automated-patching-cloudwatch

This Terraform script:

Creates a CloudWatch dashboard to monitor a specific AWS Lambda function's error metrics.

Adds an alarm that triggers when errors ≥ 1 within a 2-minute window, using the Sum statistic.

Sends notifications to an existing SNS topic: Automated_Patching_CloudWatch_Alarms_Topic.

Uses variables for dashboard name, alarm name, Lambda function name, and SNS topic ARN to make it reusable and configurable at runtime.

It provides automated monitoring and alerting for Lambda errors in a customizable and reusable way.

To execute the terraform code run below command

terraform apply -var-file="terraform.tfvars"  

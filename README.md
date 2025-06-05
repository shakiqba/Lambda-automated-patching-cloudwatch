# 🚀 AWS Lambda Monitoring with Terraform

This Terraform script automates the creation of **CloudWatch monitoring and alerting** for an AWS Lambda function.

## 🧰 Features

- 📊 **CloudWatch Dashboard**  
  Automatically creates a dashboard to visualize the **`Errors` metric** for a specified Lambda function.

- 🚨 **CloudWatch Alarm**  
  Sets up an alarm that triggers when **errors are greater than or equal to 1** within a **2-minute period**, using the `Sum` statistic.

- 📣 **SNS Notifications**  
  Sends alarm notifications to an existing SNS topic:  
  `Automated_Patching_CloudWatch_Alarms_Topic`

- 🛠️ **Configurable Inputs**  
  All key parameters are defined as variables:
  - `dashboard_name`
  - `alarm_name`
  - `lambda_function_name`
  - `sns_topic_arn`

## ✅ Benefits

- 🔁 **Reusable** — Easily apply to multiple Lambda functions.
- ⚙️ **Customizable** — Adjust names and targets through variables.
- 👨‍💻 **Minimal Effort** — One command to deploy.

## ▶️ How to Use

1. Configure your `terraform.tfvars` file with the required variables.
2. Run the following command:

```bash
terraform apply -var-file="terraform.tfvars"

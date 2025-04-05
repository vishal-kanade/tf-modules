This module creates an AWS SNS topic and subscribes one or more endpoints to it. The module takes various parameters to configure the topic name, display name, access policy, delivery policy, encryption key, and tags. The module also outputs the topic ARN for further use.

To use this module, you need to provide the following arguments:

- `sns_topic_name`: The name of the SNS topic. This is a required argument.
- `display_name`: The display name of the SNS topic. This is an optional argument. If not provided, the topic name will be used as the display name.
- `sns_access_policy`: The file path of the SNS access policy JSON file.
- `sns_delivery_policy`: The file path of the SNS delivery policy JSON file.
- `kms_master_key_id`: The ID of the KMS key to encrypt the SNS messages. 
- `sns_topic_subscription`: A map of objects that specify the protocol and endpoint for each subscription. The protocol can be one of "http", "https", "email", "email-json", "sms", "sqs" or "lambda". The endpoint is the URL, email address, phone number, SQS queue ARN, or Lambda function ARN depending on the protocol. This is an optional argument. If not provided, no subscriptions will be created.
- `tags`: A map of custom tags to apply to the SNS topic. This is an optional argument. If not provided, no tags will be applied.

Here is an example of how to use this module in your Terraform configuration:

`data "aws_iam_policy_document" "sns_topic_policy" {

  statement {
    sid = "Publish SNS"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "sns:Publish"
    ]
    resources = [
      "arn:aws:sns:us-east-1:${var.account-id}:iff${var.environment}-${var.application_name}"
    ]
  }
}

module "example" {
  source = "git::ssh://gitlab.com/danisco-nutrition-and-biosciences/iff-cloud-engineering/iff-terraform-core-modules/iff-sns.git"
  sns_topic_name = "iff${var.environment}-${var.application_name}"
  display_name    = "iff${var.environment}-${var.application_name}-Failure-Notification"

  sns_topic_subscription = {
    email_subscription = {
    protocol = "email"
    endpoint = "user@iff.com"
    }
    email_subscription1 = {
      protocol = "email"
      endpoint = "user1@iff.com"
    }
    email_subscription2 = {
      protocol = "email"
      endpoint = "user2@iff.com"
    }
  }
  sns_access_policy = data.aws_iam_policy_document.sns_topic_policy.json
  sns_delivery_policy = file("./sns_delivery_policy.json")
  kms_master_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd-1234-efgh-5678"
  tags = module.iff-tags.tags
}
`
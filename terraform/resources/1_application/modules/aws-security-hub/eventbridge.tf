#-----------------------------------------------------------------------------------------------------------------------
# Optionally configure Event Bridge (formerly CloudWatchEvents) Rules and SNS subscriptions
# We would like the SNS Topic to be encrypted, and EventBridge requires sufficient permissions for the KMS key
# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cwe-integration-types.html
# https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-use-resource-based.html
#-----------------------------------------------------------------------------------------------------------------------
##### AWS KMS key should be created through separate KMS key account

# module "sns_kms_key" {
#   source  = "cloudposse/kms-key/aws"
#   version = "0.12.1"
#   count   = local.create_sns_topic ? 1 : 0

#   name                = local.create_sns_topic ? module.sns_kms_key_label[0].id : ""
#   description         = "KMS key for the security-hub Imported Findings SNS topic"
#   enable_key_rotation = true
#   alias               = "alias/security-hub-sns"
#   policy              = local.create_sns_topic ? data.aws_iam_policy_document.sns_kms_key_policy[0].json : ""

#   context = module.this.context
# }

# data "aws_iam_policy_document" "sns_kms_key_policy" {
#   count = local.create_sns_topic ? 1 : 0

#   policy_id = "EventBridgeEncryptUsingKey"

#   statement {
#     effect = "Allow"
#     actions = [
#       "kms:*"
#     ]
#     resources = ["*"]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${one(data.aws_caller_identity.this[*].account_id)}:root"]
#     }
#   }

#   statement {
#     effect = "Allow"
#     actions = [
#       "kms:Decrypt",
#       "kms:GenerateDataKey"
#     ]
#     resources = ["*"]

#     principals {
#       type        = "Service"
#       identifiers = ["events.amazonaws.com"]
#     }
#   }
# }

module "sns_topic" {
  source  = "../aws-sns-topic"
  count   = local.create_sns_topic ? 1 : 0

  sns_topic_name   = var.sns_topic_name
  subscribers       = var.subscribers
  sqs_dlq_enabled   = var.sqs_dlq_enabled # false
  # kms_master_key_id = local.create_sns_topic ? module.sns_kms_key[0].alias_name : ""

  allowed_aws_services_for_sns_published = ["events.amazonaws.com"]
  sns_topic_tags    = var.sns_topic_tags
  

}

resource "aws_cloudwatch_event_rule" "imported_findings" {
  count       = local.enable_notifications ? 1 : 0
  name        = var.cloudwatch_er_securityhub
  description = "SecurityHubEvent - Imported Findings"
  tags        = var.cloudwatch_event_rules_security_hub_tags

  event_pattern = jsonencode(
    {
      "source" : [
        "aws.securityhub"
      ],
      "detail-type" : [
        var.cloudwatch_event_rule_pattern_detail_type
      ]
    }
  )
}

resource "aws_cloudwatch_event_target" "imported_findings" {
  count = local.enable_notifications ? 1 : 0
  rule  = aws_cloudwatch_event_rule.imported_findings[0].name
  arn   = local.imported_findings_notification_arn
}

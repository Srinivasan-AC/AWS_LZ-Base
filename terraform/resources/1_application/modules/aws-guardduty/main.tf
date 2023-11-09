#-----------------------------------------------------------------------------------------------------------------------
# Subscribe the Acccount to GuardDuty
#-----------------------------------------------------------------------------------------------------------------------
resource "aws_guardduty_detector" "guardduty" {
  enable                       = var.enable_guardduty
  finding_publishing_frequency = var.finding_publishing_frequency

  datasources {
    s3_logs {
      enable = var.s3_protection_enabled
    }
  }

  tags = merge(
    var.tags,
    var.guardduty_tags,
  )


}

#-----------------------------------------------------------------------------------------------------------------------
# Optionally configure Event Bridge Rules and SNS subscriptions
# https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-cwe-integration-types.html
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/resource-based-policies-cwe.html#sns-permissions
#-----------------------------------------------------------------------------------------------------------------------
module "guardduty_sns_topic" {

  source  = "../aws-sns-topic"
  count   = local.create_sns_topic ? 1 : 0

  subscribers     = var.subscribers
  sqs_dlq_enabled = false

}

resource "aws_sns_topic_policy" "sns_topic_publish_policy" {
  count  = var.enable_guardduty && local.create_sns_topic ? 1 : 0
  arn    = local.findings_notification_arn
  policy = data.aws_iam_policy_document.sns_topic_policy[0].json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  count     = var.enable_guardduty && local.create_sns_topic ? 1 : 0
  policy_id = "GuardDutyPublishToSNS"
  statement {
    sid = ""
    actions = [
      "sns:Publish"
    ]
    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    }
    resources = [module.guardduty_sns_topic[0].sns_topic.arn]
    effect    = "Allow"
  }
}

resource "aws_cloudwatch_event_rule" "findings" {
  count       = local.enable_cloudwatch == true ? 1 : 0
  name        = var.cloudwatch_eventrule_guardduty_name
  description = "GuardDuty Findings"
  tags        = var.cloudwatch_eventrule_guardduty_tags

  event_pattern = jsonencode(
    {
      "source" : [
        "aws.guardduty"
      ],
      "detail-type" : [
        var.cloudwatch_event_rule_pattern_detail_type
      ]
    }
  )
}

resource "aws_cloudwatch_event_target" "imported_findings" {
  count = local.enable_notifications == true ? 1 : 0
  rule  = aws_cloudwatch_event_rule.findings[0].name
  arn   = local.findings_notification_arn
}

#-----------------------------------------------------------------------------------------------------------------------
# Locals and Data References
#-----------------------------------------------------------------------------------------------------------------------
locals {
  enable_cloudwatch         = var.enable_guardduty && (var.enable_cloudwatch_guardduty || local.enable_notifications)
  enable_notifications      = var.enable_guardduty && (var.create_sns_topic_guardduty || var.findings_notification_arn != null)
  create_sns_topic          = var.enable_guardduty && var.create_sns_topic_guardduty
  findings_notification_arn = local.enable_notifications ? (var.findings_notification_arn != null ? var.findings_notification_arn : module.guardduty_sns_topic[0].sns_topic.arn) : null
}

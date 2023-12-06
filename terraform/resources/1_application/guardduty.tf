module "guardduty" {
  source = "./modules/aws-guardduty"

  enable_guardduty                    = var.enable_guardduty
  create_sns_topic_guardduty          = var.create_sns_topic_guardduty
  enable_cloudwatch_guardduty         = var.enable_cloudwatch_guardduty
  cloudwatch_eventrule_guardduty_tags = var.cloudwatch_eventrule_guardduty_tags
  guardduty_tags                      = var.guardduty_tags

}
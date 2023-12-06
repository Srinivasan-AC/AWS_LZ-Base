module "inspector" {
  source = "./modules/aws-inspector"

  create_iam_role                        = var.create_iam_role
  iam_role_name                          = var.iam_role_name
  iam_policy_name                        = var.iam_policy_name
  aws_cloudwatch_event_rule_name         = var.aws_cloudwatch_event_rule_name
  aws_inspector_assessment_target_name   = var.aws_inspector_assessment_target_name
  aws_inspector_assessment_template_name = var.aws_inspector_assessment_template_name
  enabled_rules                          = var.enabled_rules
  tags                                   = local.tags

}

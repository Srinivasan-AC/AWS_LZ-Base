output "rules" {
  description = "The AWS-managed Config Rules applied"

  value = (
    var.organization_managed ?
    module.org[0].rules :
    module.account[0].rules
  )
}

output "rule_pack_list" {
  description = "A list of all the Rule Packs included"
  value       = keys(local.pack_file["packs"])
}

output "all_rule_descriptions" {
  description = "A list of maps for Config Rules and their descriptions"

  value = [
    for rule, attr in local.final_managed_rules :
    {
      name        = rule
      severity    = attr["severity"]
      description = attr["description"]
    }
  ]
}
################################################

# output "required_tags_rule_arn" {
#   description = "The ARN of the required-tags config rule."
#   value       = concat(aws_config_config_rule.required-tags.*.arn, [""])[0]
# }

output "aws_config_role_arn" {
  description = "The ARN of the AWS config role."
  value       = concat(aws_iam_role.main.*.arn, [""])[0]
}

output "aws_config_role_name" {
  description = "The name of the IAM role used by AWS config"
  value       = concat(aws_iam_role.main.*.name, [""])[0]
}

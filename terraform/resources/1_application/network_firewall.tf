#--------------------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

locals {
  name       = "aqt-${var.network_firewall_name}"
  account_id = data.aws_caller_identity.current.account_id
  num_azs    = 2
  tags = {
    Project_name    = "AQT Seed Team"
    Deployment_name = "AWS_Landing_Zone"
  }

  logging_configuration_destination_config = [
    {
      log_destination = {
        logGroup = aws_cloudwatch_log_group.logs.name
      }
      log_destination_type = "CloudWatchLogs"
      log_type             = "ALERT"
    },
    {
      log_destination = {
        bucketName = module.s3_bucket_network_firewall.bucket_id
        prefix     = "aqt-logs"
      }
      log_destination_type = "S3"
      log_type             = "FLOW"
    }
  ]
}

# Network Firewall

module "network_firewall" {
  source = "./modules/aws-network-firewall"

  #Firewall 
  name        = var.network_firewall_name #"aqt-network-firewall" #local.name
  description = var.description
  # Only for example
  delete_protection                 = var.delete_protection                 #false
  firewall_policy_change_protection = var.firewall_policy_change_protection #false
  subnet_change_protection          = var.subnet_change_protection          #false
  vpc_id                            = module.inspection_vpc.vpc_id
  subnet_mapping = { for i in range(0, local.num_azs) :
    "subnet-${i}" => {
      subnet_id       = element(module.inspection_vpc.public_subnets, i)
      ip_address_type = "IPV4"
    }
  }

  # Logging configuration
  create_logging_configuration             = var.create_logging_configuration #true
  logging_configuration_destination_config = local.logging_configuration_destination_config

  # Policy
  # policy_description = var.policy_description
  # policy_name        = var.policy_name
  # policy_stateful_rule_group_reference = {
  #   one = { resource_arn = module.block_domains_fw_rule_group.arn }
  #   #two = { resource_arn = module.et_open_rulselt_fw_rule_group.arn }
  # }
  # var.policy_stateful_rule_group_reference >> use this variable if need to provide ARN which is alreday created.
  # above variable can be used to add aws managed stateful rule groups as well.
  # policy_stateless_default_actions          = var.policy_stateless_default_actions          #["aws:forward_to_sfe"]
  # policy_stateless_fragment_default_actions = var.policy_stateless_fragment_default_actions #["aws:forward_to_sfe"]
  # policy_stateless_rule_group_reference = {
  #   one = {
  #     priority     = 1
  #     resource_arn = module.drop_icmp_traffic_fw_rule_group.arn
  #   }

  # }

  #var.policy_stateless_rule_group_reference >> use this variable if need to provide ARN which is alreday created.

  tags       = merge(local.tags, var.tags)
  depends_on = [module.inspection_vpc]
}

# Network Firewall Rule Group - stateless
#--------------------------------------------------------------------------
#  Drop ALL ICMP Traffic Rule Group
#--------------------------------------------------------------------------
# module "drop_icmp_traffic_fw_rule_group" {
#   source = "./modules/aws-network-firewall/modules/rule-group"

#   name                       = "drop-icmp-traffic-fw-rule-group"
#   description                = var.rulegroup_description_stateless
#   type                       = "STATELESS"
#   capacity                   = var.rulegroup_capacity_stateless
#   rule_group                 = var.rule_group_stateless
#   create_resource_policy     = var.create_rulegroup_resource_policy_stateless
#   attach_resource_policy     = var.rulegroup_attach_resource_policy_stateless
#   resource_policy_principals = var.rulegroup_resource_policy_principals_stateless

#   tags = merge(local.tags, var.rulegroup_tags)
# }


# Network Firewall Rule Group - stateful
#--------------------------------------------------------------------------
#  Domain Deny list Rule Group
#--------------------------------------------------------------------------

# module "block_domains_fw_rule_group" {
#   source = "./modules/aws-network-firewall/modules/rule-group"

#   name                       = "block-domains-fw-rule-group"
#   description                = var.rulegroup_description_stateful_block_domains
#   type                       = "STATEFUL"
#   capacity                   = var.rulegroup_capacity_stateful_block_domains #capacity calculation required
#   rule_group                 = var.rule_group_stateful_block_domains
#   create_resource_policy     = var.create_rulegroup_resource_policy_stateful_block_domains
#   attach_resource_policy     = var.rulegroup_attach_resource_policy_stateful_block_domains
#   resource_policy_principals = var.rulegroup_resource_policy_principals_stateful_block_domains

#   tags = merge(local.tags, var.rulegroup_tags)
# }

#--------------------------------------------------------------------------
#  Emerging Threat Rule Group  # commented to tshoot
#--------------------------------------------------------------------------
# module "et_open_rulselt_fw_rule_group" {
#   source = "./modules/aws-network-firewall/modules/rule-group"

#   name                       = "et-open-rulselt-fw-rule-group"
#   description                = var.rulegroup_description_stateful_open_rulselt
#   type                       = "STATEFUL"
#   capacity                   = var.rulegroup_capacity_stateful_open_rulselt #capacity calculation required
#   rules                      = file("./rules/emerging-user-agents.rules")
#   create_resource_policy     = var.create_rulegroup_resource_policy_stateful_open_rulselt
#   attach_resource_policy     = var.rulegroup_attach_resource_policy_stateful_open_rulselt
#   resource_policy_principals = var.rulegroup_resource_policy_principals_stateful_open_rulselt

#   tags = merge(local.tags, var.rulegroup_tags)
# }

#--------------------------------------------------------------------------
#  Block Public DNS Resolvers  Rule Group
#--------------------------------------------------------------------------
# module "block_public_dns_resolvers" {
#   source = "./modules/aws-network-firewall/modules/rule-group"

#   name                       = "block-public-dns"
#   description                = var.rulegroup_description_stateful_dns_resolvers
#   type                       = "STATEFUL"
#   capacity                   = var.rulegroup_capacity_stateful_dns_resolvers #capacity calculation required
#   rule_group                 = var.rule_group_stateful_dns_resolvers
#   create_resource_policy     = var.create_rulegroup_resource_policy_stateful_dns_resolvers
#   attach_resource_policy     = var.rulegroup_attach_resource_policy_stateful_dns_resolvers
#   resource_policy_principals = var.rulegroup_resource_policy_principals_stateful_dns_resolvers

#   tags = merge(local.tags, var.rulegroup_tags)
# }


resource "aws_cloudwatch_log_group" "logs" {
  name              = "aqt-network-firewall-logs"
  retention_in_days = 7

  tags = local.tags
}

module "s3_bucket_network_firewall" {
  source  = "./modules/aws-s3-bucket"
  enabled = var.enable_s3_bucket_network_firewall

  bucket_name   = "aqt-network-firewall-logs-${local.account_id}"
  force_destroy = var.force_destroy

  tags = merge(
    var.tags,
    var.s3_bucket_network_firewall_tags,
    local.tags,
  )
}

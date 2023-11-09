########################################################################################################################
# Application VPC A
#######################################################################################################################
output "app_vpc_a_id" {
  description = "The ID of the VPC"
  value       = module.app_vpc_a.vpc_id
}

output "app_vpc_a_arn" {
  description = "The ARN of the VPC"
  value       = module.app_vpc_a.vpc_arn
}

output "app_vpc_a_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.app_vpc_a.vpc_cidr_block
}

output "app_vpc_a_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.app_vpc_a.vpc_enable_dns_support
}

output "app_vpc_a_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.app_vpc_a.vpc_enable_dns_hostnames
}

output "app_vpc_a_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.app_vpc_a.private_subnets
}

output "app_vpc_a_private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.app_vpc_a.private_subnet_arns
}

output "app_vpc_a_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.app_vpc_a.private_subnets_cidr_blocks
}

output "app_vpc_a_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.app_vpc_a.public_subnets
}

output "app_vpc_a_public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.app_vpc_a.public_subnet_arns
}

output "app_vpc_a_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.app_vpc_a.public_subnets_cidr_blocks
}

output "app_vpc_a_database_subnets" {
  description = "List of IDs of private subnets"
  value       = module.app_vpc_a.database_subnets
}

output "app_vpc_a_database_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.app_vpc_a.database_subnet_arns
}

output "app_vpc_a_database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.app_vpc_a.database_subnets_cidr_blocks
}

################################################################################
# VPC Module Application VPC b
################################################################################
/*
output "app_vpc_b_id" {
  description = "The ID of the VPC"
  value       = module.app_vpc_b.vpc_id
}

output "app_vpc_b_arn" {
  description = "The ARN of the VPC"
  value       = module.app_vpc_b.vpc_arn
}

output "app_vpc_b_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.app_vpc_b.vpc_cidr_block
}

output "app_vpc_b_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.app_vpc_b.vpc_enable_dns_support
}

output "app_vpc_b_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.app_vpc_b.vpc_enable_dns_hostnames
}

output "app_vpc_b_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.app_vpc_b.private_subnets
}

output "app_vpc_b_private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.app_vpc_b.private_subnet_arns
}

output "app_vpc_b_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.app_vpc_b.private_subnets_cidr_blocks
}

output "app_vpc_b_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.app_vpc_b.public_subnets
}

output "app_vpc_b_public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.app_vpc_b.public_subnet_arns
}

output "app_vpc_b_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.app_vpc_b.public_subnets_cidr_blocks
}
*/
#---------------------------------------------------------------------------
# Inspection VPC
#---------------------------------------------------------------------------
output "inspection_vpc_id" {
  description = "The ID of the VPC"
  value       = module.inspection_vpc.vpc_id
}

output "inspection_vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.inspection_vpc.vpc_arn
}

output "inspection_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.inspection_vpc.vpc_cidr_block
}

output "inspection_vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.inspection_vpc.vpc_enable_dns_support
}

output "inspection_vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.inspection_vpc.vpc_enable_dns_hostnames
}

output "inspection_vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.inspection_vpc.private_subnets
}

output "inspection_vpc_private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.inspection_vpc.private_subnet_arns
}

output "inspection_vpc_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.inspection_vpc.private_subnets_cidr_blocks
}

output "inspection_vpc_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.inspection_vpc.public_subnets
}

output "inspection_vpc_public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.inspection_vpc.public_subnet_arns
}

output "inspection_vpc_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.inspection_vpc.public_subnets_cidr_blocks
}

################################################################################
# Management VPC
################################################################################
output "mgmt_vpc_id" {
  description = "The ID of the VPC"
  value       = module.mgmt_vpc.vpc_id
}

output "mgmt_vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.mgmt_vpc.vpc_arn
}

output "mgmt_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.mgmt_vpc.vpc_cidr_block
}

output "mgmt_vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.mgmt_vpc.vpc_enable_dns_support
}

output "mgmt_vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.mgmt_vpc.vpc_enable_dns_hostnames
}

output "mgmt_vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.mgmt_vpc.private_subnets
}

output "mgmt_vpc_private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.mgmt_vpc.private_subnet_arns
}

output "mgmt_vpc_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.mgmt_vpc.private_subnets_cidr_blocks
}

output "mgmt_vpc_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.mgmt_vpc.public_subnets
}

output "mgmt_vpc_public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.mgmt_vpc.public_subnet_arns
}

output "mgmt_vpc_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.mgmt_vpc.public_subnets_cidr_blocks
}

######################################################################################
# Transit Gateway outputs
######################################################################################
output "ec2_transit_gateway_arn" {
  description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
  value       = module.tgw.ec2_transit_gateway_arn
}

output "ec2_transit_gateway_id" {
  description = "EC2 Transit Gateway identifier"
  value       = module.tgw.ec2_transit_gateway_id
}

output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = module.tgw.ec2_transit_gateway_owner_id
}

output "ec2_transit_gateway_association_default_route_table_id" {
  description = "Identifier of the default association route table"
  value       = module.tgw.ec2_transit_gateway_association_default_route_table_id
}

output "ec2_transit_gateway_propagation_default_route_table_id" {
  description = "Identifier of the default propagation route table"
  value       = module.tgw.ec2_transit_gateway_propagation_default_route_table_id
}

output "ec2_transit_gateway_vpc_attachment_ids" {
  description = "List of EC2 Transit Gateway VPC Attachment identifiers"
  value       = module.tgw.ec2_transit_gateway_vpc_attachment_ids
}

######################################################################################
# AWS Network Firewall outputs
######################################################################################
# Firewall

output "firewall_id" {
  description = "The Amazon Resource Name (ARN) that identifies the firewall"
  value       = module.network_firewall.id
}

output "firewall_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the firewall"
  value       = module.network_firewall.arn
}

output "firewall_status" {
  description = "Nested list of information about the current status of the firewall"
  value       = module.network_firewall.status
}

output "endpoint_id" {
  description = "Created Network Firewall endpoint id"
  value       = module.network_firewall.endpoint_id
}

output "firewall_update_token" {
  description = "A string token used when updating a firewall"
  value       = module.network_firewall.update_token
}

# Firewall Logging Configuration

output "firewall_logging_configuration_id" {
  description = "The Amazon Resource Name (ARN) of the associated firewall"
  value       = module.network_firewall.logging_configuration_id
}

# Firewall Policy

output "firewall_policy_id" {
  description = "The Amazon Resource Name (ARN) that identifies the firewall policy"
  value       = module.network_firewall.policy_id
}

output "firewall_policy_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the firewall policy"
  value       = module.network_firewall.policy_arn
}

output "firewall_policy_update_token" {
  description = "A string token used when updating a firewall policy"
  value       = module.network_firewall.policy_update_token
}

output "firewall_policy_resource_policy_id" {
  description = "The Amazon Resource Name (ARN) of the firewall policy associated with the resource policy"
  value       = module.network_firewall.policy_resource_policy_id
}

######################################################################################################################
# AWS GuardDuty outputs
######################################################################################################################

output "guardduty_detector" {
  value = module.guardduty.guardduty_detector
}
output "sns_topic" {
  value = module.guardduty.sns_topic
}

#######################################################################################
# Cloudtrail Outputs
#######################################################################################

output "cloudtrail_id" {
  value       = module.cloudtrail.cloudtrail_id
  description = "The name of the trail"
}

output "cloudtrail_home_region" {
  value       = module.cloudtrail.cloudtrail_home_region
  description = "The region in which the trail was created"
}

output "cloudtrail_arn" {
  value       = module.cloudtrail.cloudtrail_arn
  description = "The Amazon Resource Name of the trail"
}

output "cloudtrail_bucket_domain_name" {
  value       = module.s3_bucket.bucket_domain_name
  description = "FQDN of the CloudTral S3 bucket"
}

output "cloudtrail_bucket_id" {
  value       = module.s3_bucket.bucket_id
  description = "Name of the CloudTral S3 bucket"
}

output "cloudtrail_bucket_arn" {
  value       = module.s3_bucket.bucket_arn
  description = "ARN of the CloudTral S3 bucket"
}

######################################################################################
# AWS inspector outputs
######################################################################################

output "inspector_assessment_target" {
  description = "The AWS Inspector assessment target"
  value       = module.inspector.inspector_assessment_target
}

output "aws_inspector_assessment_template" {
  description = "The AWS Inspector assessment template"
  value       = module.inspector.aws_inspector_assessment_template
}

output "aws_cloudwatch_event_rule" {
  description = "The AWS Inspector event rule"
  value       = module.inspector.aws_cloudwatch_event_rule
}

output "aws_cloudwatch_event_target" {
  description = "The AWS Inspector event target"
  value       = module.inspector.aws_cloudwatch_event_target
}

################################################################################
# AWS Security Hub Outputs
##################################################################################
output "enabled_subscriptions" {
  description = "Enabled subscriptions"
  value       = module.security_hub.enabled_subscriptions
}

output "sns_topic_securityhub" {
  value = module.security_hub.sns_topic
}

#####################################################################################################################
# AWS Config Outputs
#####################################################################################################################
output "rules_applied" {
  description = "A list of Config Rules applied by the module"
  value       = keys(module.managed_rules.rules[0])
}

output "bucket_id" {
  value       = module.config_logs.bucket_id
  description = "Bucket ID"
}

output "bucket_arn" {
  value       = module.config_logs.bucket_arn
  description = "Bucket ARN"
}

output "bucket_domain_name" {
  value       = module.config_logs.bucket_domain_name
  description = "FQDN of bucket"
}
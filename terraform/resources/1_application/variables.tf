variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS Deployment region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
#----------------------------------------------------------------------------------------------------------------------
# app_vpc_a
#----------------------------------------------------------------------------------------------------------------------
variable "app_vpc_a_cidr" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "app_vpc_a_name" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "app_vpc_a_azs" {
  description = "Specify the AZs"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_private_subnets" {
  description = "Specify list of private subnets"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_public_subnets" {
  description = "Specify list of public subnets"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_database_subnets" {
  description = "Specify list of public subnets"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_private_subnet_names" {
  description = "Specify list of private subnets names"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_public_subnet_names" {
  description = "Specify list of public subnets names"
  type        = list(string)
  default     = []
}

variable "app_vpc_a_database_subnet_names" {
  description = "Specify list of public subnets names"
  type        = list(string)
  default     = []
}

variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)"
  type        = bool
  default     = true
}

variable "app_vpc_a_create_igw" {
  description = "Should be true to enable internet gateway in the VPC"
  type        = bool
  default     = false
}

variable "app_vpc_a_tgw_not_required" {
  description = "Should be false when TGW is required"
  type        = bool
  default     = false
}

variable "app_vpc_a_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "app_vpc_a_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "app_vpc_a_enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "app_vpc_a_enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "app_vpc_a_enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = bool
  default     = false
}

variable "app_vpc_a_dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "app_vpc_a_dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "app_vpc_a_enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "app_vpc_a_create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "app_vpc_a_create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds"
  type        = number
  default     = 60
}

# Public NACL

variable "app_vpc_a_public_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for public subnets"
  type        = bool
  default     = false
}

variable "app_vpc_a_public_inbound_acl_rules" {
  description = "Public subnets inbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "app_vpc_a_public_outbound_acl_rules" {
  description = "Public subnets outbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

# Private NACL
variable "app_vpc_a_private_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for private subnets"
  type        = bool
  default     = false
}

variable "app_vpc_a_private_inbound_acl_rules" {
  description = "Private subnets inbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "app_vpc_a_private_outbound_acl_rules" {
  description = "Private subnets outbound network ACLs"
  type        = list(map(string))
  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    },
  ]
}

variable "app_vpc_a_private_acl_tags" {
  description = "Additional tags for the private subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "app_vpc_a_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "app_vpc_a_vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "app_vpc_a_private_subnet_tags" {
  description = "Tags for the private subnet"
  type        = map(string)
  default     = {}
}
variable "app_vpc_a_public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {}
}

variable "app_vpc_a_database_subnet_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {}
}

#----------------------------------------------------------------------------------------------------------------------
# app_vpc_b
#----------------------------------------------------------------------------------------------------------------------
/*
variable "app_vpc_b_cidr" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "app_vpc_b_name" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "app_vpc_b_azs" {
  description = "Specify the AZs"
  type        = list(string)
  default     = []
}

variable "app_vpc_b_private_subnets" {
  description = "Specify list of private subnets"
  type        = list(string)
  default     = []
}

variable "app_vpc_b_public_subnets" {
  description = "Specify list of public subnets"
  type        = list(string)
  default     = []
}

variable "app_vpc_b_private_subnet_names" {
  description = "Specify list of private subnets names"
  type        = list(string)
  default     = []
}

variable "app_vpc_b_public_subnet_names" {
  description = "Specify list of public subnets names"
  type        = list(string)
  default     = []
}

variable "app_vpc_b_create_igw" {
  description = "Should be true to enable internet gateway in the VPC"
  type        = bool
  default     = false
}

variable "app_vpc_b_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "app_vpc_b_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "app_vpc_b_enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "app_vpc_b_enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "app_vpc_b_enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = bool
  default     = false
}

variable "app_vpc_b_dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "app_vpc_b_dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "app_vpc_b_enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "app_vpc_b_create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "app_vpc_b_create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}


variable "app_vpc_b_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "app_vpc_b_vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "app_vpc_b_private_subnet_tags" {
  description = "Tags for the private subnet"
  type        = map(string)
  default     = {}
}
variable "app_vpc_b_public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {}
}
*/
#----------------------------------------------------------------------------------------------------------------------
# inspection_vpc
#----------------------------------------------------------------------------------------------------------------------

variable "inspection_vpc_cidr" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "inspection_vpc_name" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "inspection_vpc_azs" {
  description = "Specify the AZs"
  type        = list(string)
  default     = []
}

variable "inspection_vpc_private_subnets" {
  description = "Specify list of private subnets"
  type        = list(string)
  default     = []
}

variable "inspection_vpc_public_subnets" {
  description = "Specify list of public subnets"
  type        = list(string)
  default     = []
}

variable "inspection_vpc_private_subnet_names" {
  description = "Specify list of private subnets names"
  type        = list(string)
  default     = []
}

variable "inspection_vpc_public_subnet_names" {
  description = "Specify list of public subnets names"
  type        = list(string)
  default     = []
}

variable "inspection_vpc_create_igw" {
  description = "Should be true to enable internet gateway in the VPC"
  type        = bool
  default     = false
}

variable "inspection_vpc_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "inspection_vpc_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "inspection_vpc_enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "inspection_vpc_enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "inspection_vpc_enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = bool
  default     = false
}

variable "inspection_vpc_dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "inspection_vpc_dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "inspection_vpc_enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "inspection_vpc_create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "inspection_vpc_create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "inspection_vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "inspection_vpc_vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "inspection_vpc_private_subnet_tags" {
  description = "Tags for the private subnet"
  type        = map(string)
  default     = {}
}
variable "inspection_vpc_public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {}
}

#----------------------------------------------------------------------------------------------------------------------
# mgmt_vpc
#----------------------------------------------------------------------------------------------------------------------

variable "mgmt_vpc_cidr" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "mgmt_vpc_name" {
  description = "Specify the CIDR range"
  type        = string
  default     = ""
}

variable "mgmt_vpc_azs" {
  description = "Specify the AZs"
  type        = list(string)
  default     = []
}

variable "mgmt_vpc_private_subnets" {
  description = "Specify list of private subnets"
  type        = list(string)
  default     = []
}

variable "mgmt_vpc_public_subnets" {
  description = "Specify list of public subnets"
  type        = list(string)
  default     = []
}

variable "mgmt_vpc_private_subnet_names" {
  description = "Specify list of private subnets names"
  type        = list(string)
  default     = []
}

variable "mgmt_vpc_public_subnet_names" {
  description = "Specify list of public subnets names"
  type        = list(string)
  default     = []
}

variable "mgmt_vpc_create_igw" {
  description = "Should be true to enable internet gateway in the VPC"
  type        = bool
  default     = false
}

variable "mgmt_vpc_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "mgmt_vpc_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "mgmt_vpc_enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "mgmt_vpc_enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "mgmt_vpc_enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = bool
  default     = false
}

variable "mgmt_vpc_dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "mgmt_vpc_dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "mgmt_vpc_enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "mgmt_vpc_create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "mgmt_vpc_create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "mgmt_vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "mgmt_vpc_vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "mgmt_vpc_private_subnet_tags" {
  description = "Tags for the private subnet"
  type        = map(string)
  default     = {}
}
variable "mgmt_vpc_public_subnet_tags" {
  description = "Tags for the public subnet"
  type        = map(string)
  default     = {}
}

#----------------------------------------------------------------------------------------------------------------------
#Transit Gateway
#----------------------------------------------------------------------------------------------------------------------
variable "transit_gateway_name" {
  description = "Specify the Transit Gateway Name"
  type        = string
  default     = ""
}


variable "enable_auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted"
  type        = bool
  default     = false
}

variable "enable_multicast_support" {
  description = "Whether multicast support is enabled"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_attachments" {
  description = "Maps of maps of VPC details to attach to TGW. Type 'any' to disable type validation by Terraform."
  type        = any
  default     = {}
}

variable "ram_allow_external_principals" {
  description = "Indicates whether principals outside your organization can be associated with a resource share."
  type        = bool
  default     = false
}

variable "ram_principals" {
  description = "A list of principals to share TGW with. Possible values are an AWS account ID, an AWS Organizations Organization ARN, or an AWS Organizations Organization Unit ARN"
  type        = list(string)
  default     = []
}

variable "tgw_description" {
  description = "Specify transit gateway description"
  type        = string
  default     = ""
}

variable "amazon_side_asn" {
  description = "Specify ASN"
  type        = number
  default     = 64532
}

variable "share_tgw" {
  description = "Whether to share your transit gateway with other accounts"
  type        = bool
  default     = true
}

variable "create_tgw" {
  description = "Controls if TGW should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

#----------------------------------------------------------------------------------------------------------------------
# Network Firewall
#----------------------------------------------------------------------------------------------------------------------

# Firewall

variable "network_firewall_name" {
  description = "A Name of the firewall"
  type        = string
  default     = ""
}

variable "description" {
  description = "A friendly description of the firewall"
  type        = string
  default     = ""
}

variable "delete_protection" {
  description = "A boolean flag indicating whether it is possible to delete the firewall. Defaults to `true`"
  type        = bool
  default     = true
}

variable "firewall_policy_change_protection" {
  description = "A boolean flag indicating whether it is possible to change the associated firewall policy. Defaults to `false`"
  type        = bool
  default     = null
}

variable "subnet_change_protection" {
  description = "A boolean flag indicating whether it is possible to change the associated subnet(s). Defaults to `true`"
  type        = bool
  default     = true
}

variable "subnet_mapping" {
  description = "Set of configuration blocks describing the public subnets. Each subnet must belong to a different Availability Zone in the VPC. AWS Network Firewall creates a firewall endpoint in each subnet"
  type        = any
  default     = {}
}

#Firewall Loggin configureation

variable "create_logging_configuration" {
  description = "Controls if a Logging Configuration should be created"
  type        = bool
  default     = false
}

variable "logging_configuration_destination_config" {
  description = "A list of min 1, max 2 configuration blocks describing the destination for the logging configuration"
  type        = any
  default     = []
}

# Firewall Policy

variable "policy_description" {
  description = "A friendly description of the firewall policy"
  type        = string
  default     = null
}

variable "policy_name" {
  description = "A friendly name of the firewall policy"
  type        = string
  default     = ""
}

variable "policy_stateful_rule_group_reference" {
  description = "Set of configuration blocks containing references to the stateful rule groups that are used in the policy. See [Stateful Rule Group Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy#stateful-rule-group-reference) for details"
  type        = any
  default     = {}
}

variable "policy_stateless_default_actions" {
  description = "Set of actions to take on a packet if it does not match any of the stateless rules in the policy. You must specify one of the standard actions including: `aws:drop`, `aws:pass`, or `aws:forward_to_sfe`"
  type        = list(string)
  default     = ["aws:pass"]
}

variable "policy_stateless_fragment_default_actions" {
  description = "Set of actions to take on a fragmented packet if it does not match any of the stateless rules in the policy. You must specify one of the standard actions including: `aws:drop`, `aws:pass`, or `aws:forward_to_sfe`"
  type        = list(string)
  default     = ["aws:pass"]
}

variable "policy_stateless_rule_group_reference" {
  description = "Set of configuration blocks containing references to the stateless rule groups that are used in the policy. See [Stateless Rule Group Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy#stateless-rule-group-reference) for details"
  type        = any
  default     = {}
}

# Network Firewall Rule Group - stateless(drop_icmp_traffic_fw_rule_group)

variable "rulegroup_capacity_stateless" {
  description = "The maximum number of operating resources that this rule group can use. For a stateless rule group, the capacity required is the sum of the capacity requirements of the individual rules. For a stateful rule group, the minimum capacity required is the number of individual rules"
  type        = number
  default     = 100
}

variable "rulegroup_description_stateless" {
  description = "A friendly description of the rule group"
  type        = string
  default     = null
}

variable "rule_group_stateless" {
  description = "A configuration block that defines the rule group rules. Required unless `rules` is specified"
  type        = any
  default     = {}
}

variable "create_rulegroup_resource_policy_stateless" {
  description = "Controls if a resource policy should be created"
  type        = bool
  default     = false
}


variable "rulegroup_resource_policy_principals_stateless" {
  description = "A list of IAM principals allowed in the resource policy"
  type        = list(string)
  default     = []
}

variable "rulegroup_attach_resource_policy_stateless" {
  description = "Controls if a resource policy should be attached to the rule group"
  type        = bool
  default     = false
}

variable "rulegroup_tags" {
  description = "A map of tags to add to Rule Group"
  type        = map(string)
  default     = {}
}

## Network Firewall Rule Group - Stateful(block_domains_fw_rule_group)

variable "rulegroup_capacity_stateful_block_domains" {
  description = "The maximum number of operating resources that this rule group can use. For a stateless rule group, the capacity required is the sum of the capacity requirements of the individual rules. For a stateful rule group, the minimum capacity required is the number of individual rules"
  type        = number
  default     = 100
}

variable "rulegroup_description_stateful_block_domains" {
  description = "A friendly description of the rule group"
  type        = string
  default     = null
}

variable "rule_group_stateful_block_domains" {
  description = "A configuration block that defines the rule group rules. Required unless `rules` is specified"
  type        = any
  default     = {}
}

# variable "type" {
#   description = "Whether the rule group is stateless (containing stateless rules) or stateful (containing stateful rules). Valid values include: `STATEFUL` or `STATELESS`"
#   type        = string
#   default     = "STATELESS"
# }

variable "create_rulegroup_resource_policy_stateful_block_domains" {
  description = "Controls if a resource policy should be created"
  type        = bool
  default     = false
}


variable "rulegroup_resource_policy_principals_stateful_block_domains" {
  description = "A list of IAM principals allowed in the resource policy"
  type        = list(string)
  default     = []
}

variable "rulegroup_attach_resource_policy_stateful_block_domains" {
  description = "Controls if a resource policy should be attached to the rule group"
  type        = bool
  default     = false
}

# ## Network Firewall Rule Group - Stateful(Emerging Threat Rule Group)

variable "rulegroup_capacity_stateful_open_rulselt" {
  description = "The maximum number of operating resources that this rule group can use. For a stateless rule group, the capacity required is the sum of the capacity requirements of the individual rules. For a stateful rule group, the minimum capacity required is the number of individual rules"
  type        = number
  default     = 100
}

variable "rulegroup_description_stateful_open_rulselt" {
  description = "A friendly description of the rule group"
  type        = string
  default     = null
}

variable "create_rulegroup_resource_policy_stateful_open_rulselt" {
  description = "Controls if a resource policy should be created"
  type        = bool
  default     = false
}


variable "rulegroup_resource_policy_principals_stateful_open_rulselt" {
  description = "A list of IAM principals allowed in the resource policy"
  type        = list(string)
  default     = []
}

variable "rulegroup_attach_resource_policy_stateful_open_rulselt" {
  description = "Controls if a resource policy should be attached to the rule group"
  type        = bool
  default     = false
}

## Network Firewall Rule Group - Stateful(Blog Public DNS Resolvers  Rule Group)

variable "rulegroup_capacity_stateful_dns_resolvers" {
  description = "The maximum number of operating resources that this rule group can use. For a stateless rule group, the capacity required is the sum of the capacity requirements of the individual rules. For a stateful rule group, the minimum capacity required is the number of individual rules"
  type        = number
  default     = 100
}

variable "rulegroup_description_stateful_dns_resolvers" {
  description = "A friendly description of the rule group"
  type        = string
  default     = null
}

variable "rule_group_stateful_dns_resolvers" {
  description = "A configuration block that defines the rule group rules. Required unless `rules` is specified"
  type        = any
  default     = {}
}

variable "create_rulegroup_resource_policy_stateful_dns_resolvers" {
  description = "Controls if a resource policy should be created"
  type        = bool
  default     = false
}


variable "rulegroup_resource_policy_principals_stateful_dns_resolvers" {
  description = "A list of IAM principals allowed in the resource policy"
  type        = list(string)
  default     = []
}

variable "rulegroup_attach_resource_policy_stateful_dns_resolvers" {
  description = "Controls if a resource policy should be attached to the rule group"
  type        = bool
  default     = false
}

################ S3 Bucket ##############

variable "enable_s3_bucket_network_firewall" {
  description = "Wheter to enable s3 bucket for network firewall"
  type        = bool
  default     = true
}

variable "s3_bucket_network_firewall_tags" {
  description = "A map of tags to add to Rule Group"
  type        = map(string)
  default     = {}
}

#######################################################################################################################
# AWS GuardDuty Vairables
#######################################################################################################################

variable "create_sns_topic_guardduty" {
  description = <<-DOC
  Flag to indicate whether an SNS topic should be created for notifications.
  If you want to send findings to a new SNS topic, set this to true and provide a valid configuration for subscribers.
  DOC

  type    = bool
  default = false
}

variable "enable_guardduty" {
  type        = bool
  default     = false
  description = "whether to create AWS Guardduty"
}

variable "enable_cloudwatch_guardduty" {
  description = <<-DOC
  Flag to indicate whether an CloudWatch logging should be enabled for GuardDuty
  DOC
  type        = bool
  default     = false
}

variable "cloudwatch_eventrule_guardduty_name" {
  type        = string
  description = "Specify Cloudwatch event rule Name"
  default     = "default_guardduty"
}

variable "cloudwatch_eventrule_guardduty_tags" {
  description = "A map of tags to add to cloudwatch event rules"
  type        = map(string)
  default     = {}
}

variable "guardduty_tags" {
  description = "A map of tags to add to S3 bucket"
  type        = map(string)
  default     = {}
}

################################################################################################################
# AWS Cloudtrail Variables
################################################################################################################

variable "cloudtrail_enabled" {
  type        = bool
  default     = true
  description = "Enable cloudtrail"
}


variable "cloudtrail_name" {
  description = "Specify the cloudtrail Name"
  type        = string
  default     = ""
}

variable "enable_log_file_validation" {
  type        = bool
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}

variable "is_multi_region_trail" {
  type        = bool
  description = "Specifies whether the trail is created in the current region or in all regions"
}

variable "include_global_service_events" {
  type        = bool
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
}

variable "enable_logging" {
  type        = bool
  description = "Enable logging for the trail"
}

variable "is_organization_trail" {
  type        = bool
  description = "The trail is an AWS Organizations trail"
}

variable "cloudtrail_tags" {
  description = "Additional tags cloudtrail"
  type        = map(string)
  default     = {}
}

variable "s3_bucket_name_cloudtrail" {
  description = "Specify the S3 bucket Name"
  type        = string
  default     = ""
}

variable "s3_bucket_tags" {
  description = "A map of tags to add to S3 bucket"
  type        = map(string)
  default     = {}
}

variable "policy" {
  type        = string
  description = "A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy"
  default     = ""
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = <<-EOT
    When `true`, permits a non-empty S3 bucket to be deleted by first deleting all objects in the bucket.
    THESE OBJECTS ARE NOT RECOVERABLE even if they were versioned and stored in Glacier.
    EOT
  nullable    = false
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket"
  nullable    = false
}

variable "enable_s3_bucket_cloudtrail" {
  type        = bool
  default     = true
  description = "whether to create s3 bucket"
}

#######################################################################################################################
# AWS Inspector Variables
#######################################################################################################################

variable "create_iam_role" {
  description = "Flag to indicate whether an IAM Role should be created to grant the proper permissions for AWS Config"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "IAM Role Name"
}

variable "iam_policy_name" {
  type        = string
  default     = ""
  description = "IAM Policy Name"
}

variable "enabled_rules" {
  type        = list(string)
  description = <<-DOC
    A list of AWS Inspector rules that should run on a periodic basis.

    Valid values are `cve`, `cis`, `nr`, `sbp` which map to the appropriate [Inspector rule arns by region](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_rules-arns.html).
  DOC
}

variable "aws_cloudwatch_event_rule_name" {
  type        = string
  description = "AWS Inspector cloudwatch event rule name"
  default     = ""
}

variable "aws_inspector_assessment_target_name" {
  type        = string
  description = "AWS Inspector Assessment target Name"
  default     = ""
}

variable "aws_inspector_assessment_template_name" {
  type        = string
  description = "AWS Inspector Assessment template Name"
  default     = ""
}

#################################################################################################################
# AWS Security Hub variables
################################################################################################################

variable "sns_topic_name" {
  type        = string
  description = "Specify SNS topic Name"
  default     = ""
}

variable "sns_topic_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "create_sns_topic" {
  description = <<-DOC
  Flag to indicate whether an SNS topic should be created for notifications

  If you want to send findings to a new SNS topic, set this to true and provide a valid configuration for subscribers
  DOC

  type    = bool
  default = false
}

variable "enabled_standards" {
  description = <<-DOC
  A list of standards/rulesets to enable

  See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/securityhub_standards_subscription#argument-reference

  The possible values are:

    - standards/aws-foundational-security-best-practices/v/1.0.0
    - ruleset/cis-aws-foundations-benchmark/v/1.2.0
    - standards/pci-dss/v/3.2.1
  DOC
  type        = list(any)
  default     = []
}

#####################################################################################################################
# AWS Config Outputs
#####################################################################################################################

variable "config_logs_bucket" {
  type = string
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "organization_managed" {
  description = "Whether the rules to create should be organization managed rules"
  default     = false
  type        = bool
}

variable "rule_packs" {
  description = "A list of Rule Packs (based off AWS Conformance Packs) to deploy"
  default     = []
  type        = list(string)
}

# In cases where rules from other packs overlap and let's say we want to exclude all overlap rules from a pack..
# this feature should address that. Example use case is where securityhub deploys CIS Level1 and 2 Rules and
# lets say we want to exclude all these rules from NIST pack
variable "rule_packs_to_exclude" {
  description = "A list of Rule Packs (based off AWS Conformance Packs) from which overlap rules to exclude"
  default     = []
  type        = list(string)
}

variable "rules_to_include" {
  description = "A list of individual AWS-managed Config Rules to deploy"
  default     = []
  type        = list(string)
}

variable "rules_to_exclude" {
  description = "A list of individual AWS-managed Config Rules to exclude from deployment"
  default     = []
  type        = list(string)
}

variable "required_tags_parameters" {
  description = "Input parameters for the required-tags rule."
  type = object({
    tag1Key   = optional(string, "CostCenter")
    tag1Value = optional(string, null)
    tag2Key   = optional(string, null)
    tag2Value = optional(string, null)
    tag3Key   = optional(string, null)
    tag3Value = optional(string, null)
    tag4Key   = optional(string, null)
    tag4Value = optional(string, null)
    tag5Key   = optional(string, null)
    tag5Value = optional(string, null)
    tag6Key   = optional(string, null)
    tag6Value = optional(string, null)
  })
  default = {
    tag1Key = "CostCenter"
  }

}
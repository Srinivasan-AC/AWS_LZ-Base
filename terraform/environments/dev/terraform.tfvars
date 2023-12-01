########################################################################################################################
# Application VPC A
#######################################################################################################################
app_vpc_a_name                                 = "app_vpc_a"
app_vpc_a_cidr                                 = "10.0.0.0/16"
app_vpc_a_azs                                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
app_vpc_a_private_subnets                      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
app_vpc_a_public_subnets                       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
app_vpc_a_database_subnets                     = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
app_vpc_a_intra_subnets                        = ["10.0.210.0/24", "10.0.211.0/24", "10.0.212.0/24"]
app_vpc_a_private_subnet_names                 = ["app_vpc_a_private_subnet1", "app_vpc_a_private_subnet2","app_vpc_a_private_subnet3"]
app_vpc_a_public_subnet_names                  = ["app_vpc_a_public_subnet1", "app_vpc_a_Public_subnet2", "app_vpc_a_Public_subnet3"]
app_vpc_a_database_subnet_names                = ["app_vpc_a_database_subnet1", "app_vpc_a_database_subnet2", "app_vpc_a_database_subnet3"]
app_vpc_a_intra_subnet_names                   = ["app_vpc_a_intra_subnet1", "app_vpc_a_intra_subnet2", "app_vpc_a_intra_subnet3"]
create_database_subnet_group                   = true
app_vpc_a_create_igw                           = true
app_vpc_a_tgw_not_required                     = false
app_vpc_a_enable_nat_gateway                   = true
app_vpc_a_single_nat_gateway                   = true
app_vpc_a_enable_dns_hostnames                 = true
app_vpc_a_enable_dns_support                   = true
app_vpc_a_enable_dhcp_options                  = true
app_vpc_a_dhcp_options_domain_name             = "service.consul"
app_vpc_a_dhcp_options_domain_name_servers     = ["127.0.0.1", "10.10.0.2"]
app_vpc_a_enable_flow_log                      = true
app_vpc_a_create_flow_log_cloudwatch_log_group = true
app_vpc_a_create_flow_log_cloudwatch_iam_role  = true

# Public Subnet NACL
app_vpc_a_public_dedicated_network_acl = true
app_vpc_a_public_inbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
]
app_vpc_a_public_outbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
]
# Private Subnet NACL - 
app_vpc_a_private_dedicated_network_acl = true
app_vpc_a_private_inbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 indicates ICMP protocol
    cidr_block  = "0.0.0.0/0"
  },
]
app_vpc_a_private_outbound_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
]
app_vpc_a_private_acl_tags = { "Name" = "AQT_Seed_Team_NACL",
"Project" = "AQT_Seed_Team_v1.0" }

app_vpc_a_tags = {
  Owner       = "aqt"
  Environment = "dev"
}
app_vpc_a_vpc_tags = {
  Name = "app_vpc_a"
}
app_vpc_a_private_subnet_tags = {

  ID = "app-vpc-a-tgw-private-subnet",
  "kubernetes.io/role/internal-elb" = 1
  
}
app_vpc_a_public_subnet_tags = {

  ID = "app-vpc-a-workload-subnet",
  "kubernetes.io/role/elb" = 1
}

app_vpc_a_database_subnet_subnet_tags = {
  ID = "app-vpc-a-database-subnet"
}

app_vpc_a_intra_subnet_subnet_tags = {
  ID = "app-vpc-a-intra-subnet"
}

########################################################################################################################
# Application VPC B 
#######################################################################################################################
/*
app_vpc_b_name                                 = "app_vpc_b"
app_vpc_b_cidr                                 = "10.102.0.0/16"
app_vpc_b_azs                                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
app_vpc_b_private_subnets                      = ["10.102.1.0/24", "10.102.2.0/24", "10.102.3.0/24"]
app_vpc_b_public_subnets                       = ["10.102.4.0/24", "10.102.5.0/24", "10.102.6.0/24"]
app_vpc_b_private_subnet_names                 = ["app_vpc_b_private_subnet1", "app_vpc_b_private_subnet2", "app_vpc_b_private_subnet3"]
app_vpc_b_public_subnet_names                  = ["app_vpc_b_public_subnet1", "app_vpc_b_Public_subnet2", "app_vpc_b_public_subnet3"]
app_vpc_b_create_igw                           = false
app_vpc_b_enable_nat_gateway                   = false
app_vpc_b_single_nat_gateway                   = false
app_vpc_b_enable_dns_hostnames                 = true
app_vpc_b_enable_dns_support                   = true
app_vpc_b_enable_dhcp_options                  = true
app_vpc_b_dhcp_options_domain_name             = "service.consul"
app_vpc_b_dhcp_options_domain_name_servers     = ["127.0.0.1", "10.10.0.2"]
app_vpc_b_enable_flow_log                      = true
app_vpc_b_create_flow_log_cloudwatch_log_group = true
app_vpc_b_create_flow_log_cloudwatch_iam_role  = true
app_vpc_b_tags = {
  Owner       = "aqt"
  Environment = "dev"
}
app_vpc_b_vpc_tags = {
  Name = "app_vpc_b"
}
app_vpc_b_private_subnet_tags = {

  Name = "app-vpc-b-tgw-subnet"
}
app_vpc_b_public_subnet_tags = {

  Name = "app-vpc-b-workload-subnet"
}
*/
#######################################################################################################################
# MGMT - VPC
######################################################################################################################
mgmt_vpc_name                                 = "mgmt_vpc"
mgmt_vpc_cidr                                 = "10.10.0.0/16"
mgmt_vpc_azs                                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
mgmt_vpc_private_subnets                      = ["10.10.0.0/28", "10.10.0.16/28", "10.10.3.0/28"]
mgmt_vpc_public_subnets                       = ["10.10.2.0/24", "10.10.1.0/24", "10.10.4.0/24"]
mgmt_vpc_private_subnet_names                 = ["mgmt_vpc_private_subnet1", "mgmt_vpc_private_subnet2", "mgmt_vpc_private_subnet3"]
mgmt_vpc_public_subnet_names                  = ["mgmt_vpc_public_subnet1", "mgmt_vpc_Public_subnet2", "mgmt_vpc_public_subnet3"]
mgmt_vpc_create_igw                           = true
mgmt_vpc_enable_nat_gateway                   = true
mgmt_vpc_single_nat_gateway                   = false
mgmt_vpc_enable_dns_hostnames                 = true
mgmt_vpc_enable_dns_support                   = true
mgmt_vpc_enable_dhcp_options                  = true
mgmt_vpc_dhcp_options_domain_name             = "service.consul"
mgmt_vpc_dhcp_options_domain_name_servers     = ["127.0.0.1", "10.10.0.2"]
mgmt_vpc_enable_flow_log                      = true
mgmt_vpc_create_flow_log_cloudwatch_log_group = true
mgmt_vpc_create_flow_log_cloudwatch_iam_role  = true
mgmt_vpc_tags = {
  Owner       = "aqt"
  Environment = "dev"
}
mgmt_vpc_vpc_tags = {
  Name = "mgmt_vpc"
}
mgmt_vpc_private_subnet_tags = {

  Name = "mgmt-tgw-subnet"
}
mgmt_vpc_public_subnet_tags = {

  Name = "mgmt-workload-subnet"
}

#######################################################################################################################
# Inspection - VPC
######################################################################################################################
inspection_vpc_name                                 = "inspection_vpc"
inspection_vpc_cidr                                 = "100.64.0.0/16"
inspection_vpc_azs                                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
inspection_vpc_private_subnets                      = ["100.64.32.0/19", "100.64.64.0/19", "100.64.96.0/19"]
inspection_vpc_public_subnets                       = ["100.64.128.0/19", "100.64.160.0/19", "100.64.192.0/19"]
inspection_vpc_private_subnet_names                 = ["inspection_vpc_private_subnet1", "inspection_vpc_private_subnet2", "inspection_vpc_private_subnet3"]
inspection_vpc_public_subnet_names                  = ["inspection_vpc_public_subnet1", "inspection_vpc_Public_subnet2", "inspection_vpc_public_subnet3"]
inspection_vpc_create_igw                           = false
inspection_vpc_enable_nat_gateway                   = false
inspection_vpc_single_nat_gateway                   = false
inspection_vpc_enable_dns_hostnames                 = true
inspection_vpc_enable_dns_support                   = true
inspection_vpc_enable_dhcp_options                  = true
inspection_vpc_dhcp_options_domain_name             = "service.consul"
inspection_vpc_dhcp_options_domain_name_servers     = ["127.0.0.1", "10.10.0.2"]
inspection_vpc_enable_flow_log                      = true
inspection_vpc_create_flow_log_cloudwatch_log_group = true
inspection_vpc_create_flow_log_cloudwatch_iam_role  = true
inspection_vpc_tags = {
  Owner       = "aqt"
  Environment = "dev"
}
inspection_vpc_vpc_tags = {
  Name = "inspection_vpc"
}
inspection_vpc_private_subnet_tags = {

  Name = "inspection-tgw-subnet"
}
inspection_vpc_public_subnet_tags = {

  Name = "inspection-vpc-firewall-subnet"
}

#######################################################################################################################
# Transit Gateway
######################################################################################################################
transit_gateway_name                  = "centralized-firewall-transit-gateway"
tgw_description                       = "centralized-firewall-transit-gateway"
amazon_side_asn                       = 64532
enable_auto_accept_shared_attachments = true
enable_multicast_support              = false
enable_dns_support                    = true
ram_allow_external_principals         = true
ram_principals                        = ["307990089504"]
share_tgw                             = true
create_tgw                            = true

#######################################################################################################################
# Logging Configuration
######################################################################################################################
enable_s3_bucket_network_firewall = true
force_destroy                     = true
s3_bucket_network_firewall_tags = { "Name" = "AQT_network_firewall_s3 bucket",
"Project" = "AQT_Seed_Team_v1.0" }

#######################################################################################################################
# Network Firewall and Policy
######################################################################################################################
network_firewall_name             = "aqt-network-firewall"
delete_protection                 = false
firewall_policy_change_protection = false
subnet_change_protection          = false
create_logging_configuration      = true

policy_description                        = "aqt-network-firewall-policy"
policy_name                               = "aqtnetworkfirewallpolicy"
policy_stateless_default_actions          = ["aws:forward_to_sfe"]
policy_stateless_fragment_default_actions = ["aws:forward_to_sfe"]
# var.policy_stateful_rule_group_reference >> use this variable if need to provide ARN which is alreday created.
#######################################################################################################################
# Firewall Rule Group
#######################################################################################################################
# Stateless
rulegroup_description_stateless = "drop-icmp-traffic-fw-rule-group"
rulegroup_capacity_stateless    = 100
rule_group_stateless = {
  rules_source = {
    stateless_rules_and_custom_actions = {
      stateless_rule = [{
        priority = 1
        rule_definition = {
          actions = ["aws:drop"]
          match_attributes = {
            source = [{
              address_definition = "0.0.0.0/0"
            }]
            destination = [{
              address_definition = "0.0.0.0/0"
            }]
            protocols = [1]
          }
        }
      }]
    }
  }
}
create_rulegroup_resource_policy_stateless     = true
rulegroup_attach_resource_policy_stateless     = true
rulegroup_resource_policy_principals_stateless = ["arn:aws:iam::199218232934:root"]
rulegroup_tags = { "Name" = "aqt-stateless-drop-icmp-rule-group",
"Project" = "AQT_Seed_Team_v1.0" }

# Stateful
# Block Domain
rulegroup_description_stateful_block_domains = "block-domains-fw-rule-group"
rulegroup_capacity_stateful_block_domains    = 100
rule_group_stateful_block_domains = {
  rule_variables = {
    ip_sets = [{
      key = "HOME_NET"
      ip_set = {
        definition = [
          "10.0.0.0/16",   #module.app_vpc_a.vpc_cidr_block,
          "10.102.0.0/16", #module.app_vpc_b.vpc_cidr_block,
        ]
      }
    }]
  }
  rules_source = {
    rules_source_list = {
      generated_rules_type = "DENYLIST"
      target_types         = ["HTTP_HOST", "TLS_SNI"]
      targets = [
        ".facebook.com",
        ".twitter.com",
        ".yahoo.com"
      ]
    }
  }
}
create_rulegroup_resource_policy_stateful_block_domains     = true
rulegroup_attach_resource_policy_stateful_block_domains     = true
rulegroup_resource_policy_principals_stateful_block_domains = ["arn:aws:iam::199218232934:root"]
#Open Ruleset
rulegroup_description_stateful_open_rulselt                = "Stateful Inspection from rules specifications defined in Suricata flat format"
rulegroup_capacity_stateful_open_rulselt                   = 250
create_rulegroup_resource_policy_stateful_open_rulselt     = true
rulegroup_attach_resource_policy_stateful_open_rulselt     = true
rulegroup_resource_policy_principals_stateful_open_rulselt = ["arn:aws:iam::199218232934:root"]
#Block Public DNS
rulegroup_description_stateful_dns_resolvers = "block-public-dns"
rulegroup_capacity_stateful_dns_resolvers    = 10
rule_group_stateful_dns_resolvers = {
  rules_source = {
    stateful_rule = [{
      action = "DROP"
      header = {
        destination      = "ANY"
        destination_port = "ANY"
        direction        = "ANY"
        protocol         = "DNS"
        source           = "ANY"
        source_port      = "ANY"
      }

      rule_option = [{
        keyword  = "sid"
        settings = ["50"]
      }]
    }]
  }
}
create_rulegroup_resource_policy_stateful_dns_resolvers     = true
rulegroup_attach_resource_policy_stateful_dns_resolvers     = true
rulegroup_resource_policy_principals_stateful_dns_resolvers = ["arn:aws:iam::199218232934:root"]
#######################################################################################################################
# AWS GuardDuty Variables
#######################################################################################################################

create_sns_topic_guardduty          = true
enable_guardduty                    = true
enable_cloudwatch_guardduty         = true
cloudwatch_eventrule_guardduty_name = "demo-AQT-SEED-guardduty"
guardduty_tags = { "Name" = "AQT_Seed_Team_guardduty",
"Project" = "AQT_Seed_Team_v1.0" }

##################################################################################################################
# Cloudtrail Inputs
##################################################################################################################

cloudtrail_enabled            = true
cloudtrail_name               = "democloudtrailaqt"
enable_log_file_validation    = true
is_multi_region_trail         = false
include_global_service_events = false
enable_logging                = true
is_organization_trail         = false
cloudtrail_tags = { "Name" = "AQT_Seed_Team_cloudtrail",
"Project" = "AQT_Seed_Team_v1.0" }
s3_bucket_name_cloudtrail = "demoaqtseedteam"
versioning_enabled        = true
s3_bucket_tags = { "Name" = "AQT_Seed_Team_s3 bucket",
"Project" = "AQT_Seed_Team_v1.0" }

############################################################################################
# AWS Inspector inputs
############################################################################################

create_iam_role                        = true
iam_role_name                          = "aqt-aws-inspector-role"
iam_policy_name                        = "aqt-aws-inspector-policy"
aws_cloudwatch_event_rule_name         = "aqt-aws-inspector"
aws_inspector_assessment_target_name   = "aqt-aws-inspector-target"
aws_inspector_assessment_template_name = "aqt-aws-inspector-template"
enabled_rules                          = ["cis"]

######################################################################################################################
# AWS Security-Hub Inputs
######################################################################################################################

create_sns_topic  = true
enabled_standards = ["standards/aws-foundational-security-best-practices/v/1.0.0", "standards/cis-aws-foundations-benchmark/v/1.4.0"]
sns_topic_name    = "Demo-AQT-SEED-SNS"
sns_topic_tags = { "Name" = "AQT_Seed_Team_s3 bucket",
"Project" = "AQT_Seed_Team_v1.0" }

######################################################################################################################
# AWS Config Inputs
######################################################################################################################

organization_managed = false # this is the default setting
rule_packs = [
  "Operational-Best-Practices-for-CIS-Critical-Security-Controls-v8-IG3",
  "Operational-Best-Practices-for-NIST-800-53-rev-4",
]
rule_packs_to_exclude = [
  "Operational-Best-Practices-for-CIS-AWS-v1.4-Level1",
  "Operational-Best-Practices-for-CIS-AWS-v1.4-Level2",
]
# Extra rules not included in the Packs you want to deploy
rules_to_include = [
  "dax-encryption-enabled",
  "required-tags"
]
rules_to_exclude = [
  "lambda-concurrency-check",
]

required_tags_parameters = {
  tag1Key   = "Name"
  tag1Value = "aqt-project"
}

config_logs_bucket = "aqt-aws-config-bucket"

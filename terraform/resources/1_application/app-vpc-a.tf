################################################################################
# VPC Module Application VPC A
################################################################################

locals {
  region = var.region
}

module "app_vpc_a" {

  source = "./modules/aws-vpc"

  name = var.app_vpc_a_name
  cidr = var.app_vpc_a_cidr

  azs              = var.app_vpc_a_azs #["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets  = var.app_vpc_a_private_subnets
  public_subnets   = var.app_vpc_a_public_subnets
  database_subnets = var.app_vpc_a_database_subnets
  intra_subnets = var.app_vpc_a_intra_subnets

  private_subnet_names  = var.app_vpc_a_private_subnet_names
  public_subnet_names   = var.app_vpc_a_public_subnet_names
  database_subnet_names = var.app_vpc_a_database_subnet_names
  intra_subnet_names = var.app_vpc_a_intra_subnet_names

  create_database_subnet_group = var.create_database_subnet_group

  # IGW
  create_igw = var.app_vpc_a_create_igw

  tgw_not_required = var.app_vpc_a_tgw_not_required

  # NAT Gateway
  enable_nat_gateway = var.app_vpc_a_enable_nat_gateway
  single_nat_gateway = var.app_vpc_a_single_nat_gateway

  # DNS
  enable_dns_hostnames = var.app_vpc_a_enable_dns_hostnames
  enable_dns_support   = var.app_vpc_a_enable_dns_support

  # DHCP options set
  enable_dhcp_options              = var.app_vpc_a_enable_dhcp_options
  dhcp_options_domain_name         = var.app_vpc_a_dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.app_vpc_a_dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = var.app_vpc_a_enable_flow_log
  create_flow_log_cloudwatch_log_group = var.app_vpc_a_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.app_vpc_a_create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval    = 60

  # Public subnet NACL
  public_dedicated_network_acl = var.app_vpc_a_public_dedicated_network_acl
  public_inbound_acl_rules     = var.app_vpc_a_public_inbound_acl_rules
  public_outbound_acl_rules    = var.app_vpc_a_public_outbound_acl_rules

  # Private subnet NACL
  private_dedicated_network_acl = var.app_vpc_a_private_dedicated_network_acl
  private_inbound_acl_rules     = var.app_vpc_a_private_inbound_acl_rules
  private_outbound_acl_rules    = var.app_vpc_a_private_outbound_acl_rules
  private_acl_tags              = var.app_vpc_a_private_acl_tags

  # Tags
  tags                 = var.app_vpc_a_tags
  vpc_tags             = var.app_vpc_a_vpc_tags
  private_subnet_tags  = var.app_vpc_a_private_subnet_tags
  public_subnet_tags   = var.app_vpc_a_public_subnet_tags
  database_subnet_tags = var.app_vpc_a_database_subnet_subnet_tags
  intra_subnet_tags    = var.app_vpc_a_intra_subnet_subnet_tags

}

resource "aws_route" "app_vpc_a_tgw_route" {
  count                  = length(module.app_vpc_a.public_route_table_ids)
  route_table_id         = module.app_vpc_a.public_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id

  depends_on = [
    module.tgw,
    module.app_vpc_a,
  ]
}

################################################################################
# VPC Module Application VPC A - SSM Endpoint
################################################################################
module "app_vpc_a_ssm_endpoint" {

  source = "./modules/aws-vpc/modules/vpc-endpoints"
  vpc_id = module.app_vpc_a.vpc_id
  # security_group_ids = var.security_group_ids
  endpoints = {
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      subnet_ids          = module.app_vpc_a.public_subnets
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true,
      subnet_ids          = module.app_vpc_a.public_subnets
    },
    ec2messages = {
      service             = "ec2messages",
      private_dns_enabled = true,
      subnet_ids          = module.app_vpc_a.public_subnets
    },
    execute-api = {
      service             = "execute-api",
      private_dns_enabled = true,
      subnet_ids          = module.app_vpc_a.public_subnets
    }

  }
}

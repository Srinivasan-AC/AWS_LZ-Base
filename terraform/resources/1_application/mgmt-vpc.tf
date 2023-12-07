################################################################################
# Management VPC
################################################################################
module "mgmt_vpc" {
  source = "./modules/aws-vpc"
  name   = var.mgmt_vpc_name
  cidr   = var.mgmt_vpc_cidr

  azs             = var.mgmt_vpc_azs #["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = var.mgmt_vpc_private_subnets
  public_subnets  = var.mgmt_vpc_public_subnets

  private_subnet_names = var.mgmt_vpc_private_subnet_names
  public_subnet_names  = var.mgmt_vpc_public_subnet_names

  # IGW
  create_igw = var.mgmt_vpc_create_igw

  # NAT Gateway
  enable_nat_gateway = var.mgmt_vpc_enable_nat_gateway
  single_nat_gateway = var.mgmt_vpc_single_nat_gateway

  # DNS
  enable_dns_hostnames = var.mgmt_vpc_enable_dns_hostnames
  enable_dns_support   = var.mgmt_vpc_enable_dns_support

  # DHCP options set
  enable_dhcp_options              = var.mgmt_vpc_enable_dhcp_options
  dhcp_options_domain_name         = var.mgmt_vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.mgmt_vpc_dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = var.mgmt_vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = var.mgmt_vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.mgmt_vpc_create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval    = 60

  tags                = var.mgmt_vpc_tags
  vpc_tags            = var.mgmt_vpc_vpc_tags
  private_subnet_tags = var.mgmt_vpc_private_subnet_tags
  public_subnet_tags  = var.mgmt_vpc_public_subnet_tags

}

resource "aws_route" "mgmt_vpc_route_to_tgw" {
  route_table_id         = module.mgmt_vpc.public_route_table_ids[0]
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id

  depends_on = [module.tgw]

}

resource "aws_route" "mgmt_vpc_route_to_tgw_private" {
  route_table_id         = module.mgmt_vpc.private_route_table_ids[0]
  destination_cidr_block = "10.0.0.0/8"
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id

  depends_on = [module.tgw]

}
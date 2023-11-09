#---------------------------------------------------------------------------
# Inspection VPC
#---------------------------------------------------------------------------
module "inspection_vpc" {
  source = "./modules/aws-vpc"
  name   = var.inspection_vpc_name #"inspection_vpc"
  cidr   = var.inspection_vpc_cidr # "100.64.0.0/16"

  azs             = var.inspection_vpc_azs             #["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = var.inspection_vpc_private_subnets #["100.64.32.0/19", "100.64.64.0/19", "100.64.96.0/19"]
  public_subnets  = var.inspection_vpc_public_subnets  # ["100.64.128.0/19", "100.64.160.0/19", "100.64.192.0/19"]

  # IGW
  create_igw = var.inspection_vpc_create_igw

  # NAT Gateway
  enable_nat_gateway = var.inspection_vpc_enable_nat_gateway
  single_nat_gateway = var.inspection_vpc_single_nat_gateway

  # DNS
  enable_dns_hostnames = var.inspection_vpc_enable_dns_hostnames
  enable_dns_support   = var.inspection_vpc_enable_dns_support

  # DHCP options set
  enable_dhcp_options              = var.inspection_vpc_enable_dhcp_options
  dhcp_options_domain_name         = var.inspection_vpc_dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.inspection_vpc_dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = var.inspection_vpc_enable_flow_log
  create_flow_log_cloudwatch_log_group = var.inspection_vpc_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.inspection_vpc_create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval    = 60

  tags                = var.inspection_vpc_tags
  vpc_tags            = var.inspection_vpc_vpc_tags
  private_subnet_tags = var.inspection_vpc_private_subnet_tags
  public_subnet_tags  = var.inspection_vpc_public_subnet_tags

}

#---------------------------------------------------------------------------
# Inspection VPC Firewall Endpoint and TGW Route
#---------------------------------------------------------------------------
resource "aws_route" "inspection_vpc_tgw_rt_route" {
  count                  = length(module.inspection_vpc.private_route_table_ids)
  route_table_id         = element(module.inspection_vpc.private_route_table_ids, count.index)
  vpc_endpoint_id        = module.network_firewall.endpoint_id[count.index]
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    module.network_firewall
  ]
}

resource "aws_route" "inspection_vpc_firewall_route" {
  count                  = length(module.inspection_vpc.public_route_table_ids)
  route_table_id         = element(module.inspection_vpc.public_route_table_ids, count.index)
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    module.tgw
  ]
}

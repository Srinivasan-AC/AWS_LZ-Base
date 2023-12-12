################################################################################
# VPC Module Application VPC b
################################################################################

module "app_vpc_b" {
  source = "./modules/aws-vpc"
  name   = var.app_vpc_b_name 
  cidr   = var.app_vpc_b_cidr 

  azs             = var.app_vpc_b_azs             
  private_subnets = var.app_vpc_b_private_subnets 
  intra_subnets  = var.app_vpc_b_intra_subnets 

  private_subnet_names = var.app_vpc_b_private_subnet_names
  intra_subnet_names  = var.app_vpc_b_intra_subnet_names

  # IGW
  create_igw = var.app_vpc_b_create_igw

  # NAT Gateway
  enable_nat_gateway = var.app_vpc_b_enable_nat_gateway
  single_nat_gateway = var.app_vpc_b_single_nat_gateway

  # DNS
  enable_dns_hostnames = var.app_vpc_b_enable_dns_hostnames
  enable_dns_support   = var.app_vpc_b_enable_dns_support

  # DHCP options set
  enable_dhcp_options              = var.app_vpc_b_enable_dhcp_options
  dhcp_options_domain_name         = var.app_vpc_b_dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.app_vpc_b_dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = var.app_vpc_b_enable_flow_log
  create_flow_log_cloudwatch_log_group = var.app_vpc_b_create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.app_vpc_b_create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval    = 60

  tags                = var.app_vpc_b_tags
  vpc_tags            = var.app_vpc_b_vpc_tags
  private_subnet_tags = var.app_vpc_b_private_subnet_tags
  intra_subnet_tags  = var.app_vpc_b_intra_subnet_tags 

}
resource "aws_route" "app_vpc_b_tgw_route_private" {
  count                  = length(module.app_vpc_b.private_route_table_ids)
  route_table_id         = module.app_vpc_b.private_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id

  depends_on = [
    module.tgw,
    module.app_vpc_b,
  ]
}

resource "aws_route" "app_vpc_b_tgw_route_intra" {
  count                  = length(module.app_vpc_b.intra_route_table_ids)
  route_table_id         = module.app_vpc_b.intra_route_table_ids[count.index]
  destination_cidr_block = "0.0.0.0/0"
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id

  depends_on = [
    module.tgw,
    module.app_vpc_b,
  ]
}



################################################################################
# VPC Module Application VPC B - SSM Endpoint
################################################################################

# module "app_vpc_b_ssm_endpoint" {

#   source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
#   vpc_id = module.app_vpc_b.vpc_id
#   # security_group_ids = var.security_group_ids

#   endpoints = {
#     ssm = {
#       service             = "ssm"
#       private_dns_enabled = true
#       subnet_ids          = module.app_vpc_b.public_subnets
#     },
#     ssmmessages = {
#       service             = "ssmmessages"
#       private_dns_enabled = true,
#       subnet_ids          = module.app_vpc_b.public_subnets
#     },
#     ec2messages = {
#       service             = "ec2messages",
#       private_dns_enabled = true,
#       subnet_ids          = module.app_vpc_b.public_subnets
#     }

#   }
# }

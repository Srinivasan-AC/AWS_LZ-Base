#------------------------------------------------------------------------
# Transit Gateway  Resources
#------------------------------------------------------------------------

module "tgw" {
  source = "./modules/aws-transit-gateway"

  name            = var.transit_gateway_name
  description     = var.tgw_description
  amazon_side_asn = var.amazon_side_asn
  # When "true" there is no need for RAM resources if using multiple AWS accounts
  enable_auto_accept_shared_attachments = var.enable_auto_accept_shared_attachments
  # When "true", allows service discovery through IGMP
  enable_multicast_support = var.enable_multicast_support

  vpc_attachments = {
    app_vpc_a = {
      vpc_id                                          = module.app_vpc_a.vpc_id
      subnet_ids                                      = module.app_vpc_a.private_subnets
      dns_support                                     = var.enable_dns_support
      ipv6_support                                    = false
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      transit_gateway_route_table_id                  = aws_ec2_transit_gateway_route_table.firewall_rt_table.id
      tags = {
        Name = "${var.transit_gateway_name}-app-vpc-a"
      }
    },
    # app_vpc_b = {
    #   vpc_id                                          = module.app_vpc_b.vpc_id
    #   subnet_ids                                      = module.app_vpc_b.private_subnets
    #   dns_support                                     = var.enable_dns_support #true
    #   ipv6_support                                    = false
    #   transit_gateway_default_route_table_association = false
    #   transit_gateway_default_route_table_propagation = true
    #   transit_gateway_route_table_id                  = aws_ec2_transit_gateway_route_table.app_rt_table.id
    #   tags = {
    #     Name = "${var.transit_gateway_name}-app-vpc-b"
    #   }
    # },
    inspection_vpc = {
      vpc_id                                          = module.inspection_vpc.vpc_id
      appliance_mode_support                          = true
      subnet_ids                                      = module.inspection_vpc.private_subnets
      transit_gateway_default_route_table_association = true
      transit_gateway_default_route_table_propagation = true
      ipv6_support                                    = false
      transit_gateway_route_table_id                  = aws_ec2_transit_gateway_route_table.inspection_vpc_rt_table.id
      tags = {
        Name = "${var.transit_gateway_name}-inspection-vpc"
      }
    },
    mgmt_vpc = {
      vpc_id                                          = module.mgmt_vpc.vpc_id
      subnet_ids                                      = module.mgmt_vpc.private_subnets
      dns_support                                     = var.enable_dns_support
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      ipv6_support                                    = false
      transit_gateway_route_table_id                  = aws_ec2_transit_gateway_route_table.firewall_rt_table.id
      tags = {
        Name = "${var.transit_gateway_name}-mgmt-vpc"
      }
    }
  }

  ram_allow_external_principals = var.ram_allow_external_principals
  ram_principals                = var.ram_principals
  share_tgw                     = var.share_tgw
  create_tgw                    = var.create_tgw

  depends_on = [module.app_vpc_a, module.inspection_vpc, module.mgmt_vpc]
  tags       = local.tags
}

#------------------------------------------------------------------------
# Management Transit Gateway  Route Table
#------------------------------------------------------------------------
resource "aws_ec2_transit_gateway_route_table" "inspection_vpc_rt_table" {
  transit_gateway_id = module.tgw.ec2_transit_gateway_id
  tags = {
    Name = "inspection-spoke-route-table"
  }

}

resource "aws_ec2_transit_gateway_route" "inspection_vpc_route" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_vpc_rt_table.id
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = module.tgw.ec2_transit_gateway_vpc_attachment["inspection_vpc"]["id"]
  blackhole                      = false

}
#------------------------------------------------------------------------
# Firewall  Transit Gateway  Route Table
#------------------------------------------------------------------------
resource "aws_ec2_transit_gateway_route_table" "firewall_rt_table" {
  transit_gateway_id = module.tgw.ec2_transit_gateway_id
  tags = {
    Name = "firewall-route-table"
  }

}

# resource "aws_ec2_transit_gateway_route" "app_vpc_b_tgw_route" {
#   transit_gateway_attachment_id  = module.tgw.ec2_transit_gateway_vpc_attachment["app_vpc_b"]["id"]
#   destination_cidr_block         = module.app_vpc_b.vpc_cidr_block
#   transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall_rt_table.id

# }

resource "aws_ec2_transit_gateway_route" "mgmt_vpc_attachment" {
  transit_gateway_attachment_id  = module.tgw.ec2_transit_gateway_vpc_attachment["mgmt_vpc"]["id"]
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall_rt_table.id

}

resource "aws_ec2_transit_gateway_route" "app_vpc_a_tgw_route" {
  transit_gateway_attachment_id  = module.tgw.ec2_transit_gateway_vpc_attachment["app_vpc_a"]["id"]
  destination_cidr_block         = module.app_vpc_a.vpc_cidr_block
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.firewall_rt_table.id

}



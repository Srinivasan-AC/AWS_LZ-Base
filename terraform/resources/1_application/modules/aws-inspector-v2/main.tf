
# Terraform resource for managing an Amazon Inspector Delegated Admin Account.
resource "aws_inspector2_delegated_admin_account" "delegated_admin_account" {
  count = var.create_delegated_admin_account ? 1 : 0
  account_id = var.delegated_admin_account_id
}

#Terraform resource for enabling Amazon Inspector resource scans.
#This resource must be created in the Organization's Administrator Account.

resource "aws_inspector2_enabler" "enabler" {
  count = var.create_enabler ? 1 : 0
  account_ids    = var.enabler_account_ids 
  resource_types = var.resource_types 
}

# Terraform resource for associating accounts to existing Inspector instances.

resource "aws_inspector2_member_association" "member_association" {
  count = var.create_member_association ? 1 : 0
  account_id = var.member_association_account_id 
}

# Terraform resource for managing an Amazon Inspector Organization Configuration.
# Note: In order for this resource to work, the account you use must be an Inspector Delegated Admin Account.
# Note: When this resource is deleted, EC2, ECR and Lambda scans will no longer be automatically enabled for new members of your Amazon Inspector organization.

resource "aws_inspector2_organization_configuration" "organization_configuration" {
  count = var.create_organization_configuration ? 1 : 0
  auto_enable {
    ec2    = var.enable_organization_configuration_ec2  
    ecr    = var.enable_organization_configuration_ecr  
    lambda = var.enable_organization_configuration_lambda  
  }
}

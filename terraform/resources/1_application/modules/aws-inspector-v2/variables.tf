variable "create_delegated_admin_account" {
  description = ""
  type        = bool
  default     = false
}

variable "create_enabler" {
  description = ""
  type        = bool
  default     = false
}

variable "create_member_association" {
  description = ""
  type        = bool
  default     = false
}

variable "create_organization_configuration" {
  description = ""
  type        = bool
  default     = false
}

variable "delegated_admin_account_id" {
  description = "(Required) Account to enable as delegated admin account."
  type        = string
  default     = ""
}

variable "enabler_account_ids" {
  description = "(Required) Set of account IDs. Can contain one of: the Organization's Administrator Account, or one or more Member Accounts."
  type        = list(string)
  default     = []
}

variable "resource_types" {
  description = "(Required) Type of resources to scan. Valid values are EC2, ECR, and LAMBDA. At least one item is required."
  type        = list(string)
  default     = []
}

variable "member_association_account_id" {
  description = "(Required) ID of the account to associate"
  type        = string
  default     = "123456789012"
}

variable "enable_organization_configuration_ec2" {
  description = "(Required) Whether Amazon EC2 scans are automatically enabled for new members of your Amazon Inspector organization."
  type        = bool
  default     = true
}

variable "enable_organization_configuration_ecr" {
  description = "(Required) Whether Amazon ECR scans are automatically enabled for new members of your Amazon Inspector organization."
  type        = bool
  default     = true
}

variable "enable_organization_configuration_lambda" {
  description = " (Optional) Whether Lambda Function scans are automatically enabled for new members of your Amazon Inspector organization."
  type        = bool
  default     = false
}
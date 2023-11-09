
# Variables not required for settings unrelated to specific Config Rules

variable "rules_to_include" {
  description = "A list of individual AWS-managed Config Rules to deploy"
  default     = []
  type        = list(string)
}

variable "rule_overrides" {
  description = "Override the configuration for any managed rule"
  default     = {}
  type        = any
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

variable "rules_to_exclude" {
  description = "A list of individual AWS-managed Config Rules to exclude from deployment"
  default     = []
  type        = list(string)
}

variable "excluded_accounts" {
  description = "AWS accounts to exclude from the managed config rules"
  default     = []
  type        = list(string)
}

variable "organization_managed" {
  description = "Whether the rules to create should be organization managed rules"
  default     = false
  type        = bool
}

variable "rule_name_prefix" {
  description = "Rule names created should start with the specified string"
  default     = ""
  type        = string
}

variable "tags" {
  description = "Tags to add to config rules (not applicable to organization managed rules)"
  default     = {}
  type        = map(string)
}

###########################################################################################################3

variable "config_name" {
  description = "The name of the AWS Config instance."
  type        = string
  default     = "aws-config"
}

variable "config_aggregator_name" {
  description = "The name of the aggregator."
  type        = string
  default     = "organization"
}

variable "aggregate_organization" {
  description = "Aggregate compliance data by organization"
  type        = bool
  default     = false
}

variable "config_role_permissions_boundary" {
  description = "The ARN of the permissions boundary to apply to IAM roles created for AWS Config"
  type        = string
  default     = null
}

variable "config_logs_bucket" {
  description = "The S3 bucket for AWS Config logs. If you have set enable_config_recorder to false then this can be an empty string."
  type        = string
}

variable "config_logs_prefix" {
  description = "The S3 prefix for AWS Config logs."
  type        = string
  default     = "config"
}

variable "config_logs_bucket_kms_key_arn" {
  description = "The ARN of the AWS KMS key used to encrypt objects delivered by AWS Config. Must belong to the same Region as the destination S3 bucket."
  type        = string
  default     = null
}

variable "config_max_execution_frequency" {
  description = "The maximum frequency with which AWS Config runs evaluations for a rule."
  type        = string
  default     = "TwentyFour_Hours"
}

variable "config_delivery_frequency" {
  description = "The frequency with which AWS Config delivers configuration snapshots."
  default     = "Six_Hours"
  type        = string
}

variable "acm_days_to_expiration" {
  description = "Specify the number of days before the rule flags the ACM Certificate as noncompliant."
  type        = number
  default     = 14
}



variable "include_global_resource_types" {
  description = "Specifies whether AWS Config includes all supported types of global resources with the resources that it records."
  type        = bool
  default     = true
}

variable "config_sns_topic_arn" {
  description = "An SNS topic to stream configuration changes and notifications to."
  type        = string
  default     = null
}

variable "enable_config_recorder" {
  description = "Enables configuring the AWS Config recorder resources in this module."
  type        = bool
  default     = true
}


variable "kms_key_id" {
  description = "Amazon Resource Name (ARN) of the KMS key that is used to encrypt the EFS file system."
  type        = string
  default     = "example,CSV"
}


variable "exclude_permission_boundary" {
  description = "Boolean to exclude the evaluation of IAM policies used as permissions boundaries. If set to 'true', the rule will not include permissions boundaries in the evaluation. Otherwise, all IAM policies in scope are evaluated when set to 'false.'"
  type        = bool
  default     = false
}


variable "authorized_vpc_ids" {
  description = "Comma-separated list of the authorized VPC IDs with attached IGWs. If parameter is not provided all attached IGWs will be NON_COMPLIANT."
  type        = string
  default     = "example,CSV"
}


variable "vpc_sg_authorized_ports" {
  description = "Object with values as Comma-separated list of ports authorized to be open to 0.0.0.0/0. Ranges are defined by dash. example, '443,1020-1025'"
  type = object({
    authorizedTcpPorts = optional(string, null)
    authorizedUdpPorts = optional(string, null)
  })
  default = {}
}

variable "resource_types" {
  description = "A list that specifies the types of AWS resources for which AWS Config records configuration changes (for example, AWS::EC2::Instance or AWS::CloudTrail::Trail). See relevant part of AWS Docs for available types."
  type        = list(string)
  default     = []
}

variable "enable_multi_account_logs" {
  description = "Enable sending of logs and snapshots from different Config accounts / regions into a single bucket"
  type        = bool
  default     = false
}



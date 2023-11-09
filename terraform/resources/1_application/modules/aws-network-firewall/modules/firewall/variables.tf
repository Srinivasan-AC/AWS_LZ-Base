variable "create" {
  description = "Controls if resources should be created"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# Firewall
################################################################################

variable "delete_protection" {
  description = "A boolean flag indicating whether it is possible to delete the firewall. Defaults to `true`"
  type        = bool
  default     = true
}

variable "description" {
  description = "A friendly description of the firewall"
  type        = string
  default     = ""
}

variable "encryption_configuration" {
  description = "KMS encryption configuration settings"
  type        = any
  default     = {}
}

variable "firewall_policy_arn" {
  description = "The ARN of the Firewall Policy to use"
  type        = string
  default     = ""
}

variable "firewall_policy_change_protection" {
  description = "A boolean flag indicating whether it is possible to change the associated firewall policy. Defaults to `false`"
  type        = bool
  default     = null
}

variable "name" {
  description = "A friendly name of the firewall"
  type        = string
  default     = ""
}

variable "subnet_change_protection" {
  description = "A boolean flag indicating whether it is possible to change the associated subnet(s). Defaults to `true`"
  type        = bool
  default     = true
}

variable "subnet_mapping" {
  description = "Set of configuration blocks describing the public subnets. Each subnet must belong to a different Availability Zone in the VPC. AWS Network Firewall creates a firewall endpoint in each subnet"
  type        = any
  #default     = {}
}

# variable "vpc_subnets" {
#   type        = any #map(string)
#   description = <<-EOF
#   Map of subnet IDs to place the Network Firewall endpoints. The expected format of the map is the Availability Zone as key, and the ID of the subnet as value.
#   Example (supposing us-east-1 as AWS Region): 
#   ```
#   vpc_subnets = {
#       us-east-1a = subnet-IDa
#       us-east-1b = subnet-IDb
#       us-east-1c = subnet-IDc
#   }
#   ```
# EOF
# }

variable "vpc_id" {
  description = "The unique identifier of the VPC where AWS Network Firewall should create the firewall"
  type        = string
  default     = ""
}

################################################################################
# Firewall Logging Configuration
################################################################################

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

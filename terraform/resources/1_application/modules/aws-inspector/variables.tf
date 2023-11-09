variable "create_iam_role" {
  description = "Flag to indicate whether an IAM Role should be created to grant the proper permissions for AWS Config"
  type        = bool
  default     = false
}

variable "enable_aws_inspector" {
  description = "Flag to indicate whether aws inspector create or not"
  type        = bool
  default     = true
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "IAM Role Name"
}

variable "iam_policy_name" {
  type        = string
  default     = ""
  description = "IAM Policy Name"
}

variable "iam_role_arn" {
  description = <<-DOC
    The ARN for an IAM Role AWS Config uses to make read or write requests to the delivery channel and to describe the
    AWS resources associated with the account. This is only used if create_iam_role is false.

    If you want to use an existing IAM Role, set the value of this to the ARN of the existing topic and set
    create_iam_role to false.
  DOC
  default     = null
  type        = string
}


variable "aws_inspector_assessment_target_name" {
  type        = string
  description = "AWS Inspector Assessment target Name"
  default     = "" 
}

variable "aws_inspector_assessment_template_name" {
  type        = string
  description = "AWS Inspector Assessment template Name"
  default     = "" 
}

variable "assessment_duration" {
  type        = string
  description = "The max duration of the Inspector assessment run in seconds"
  default     = "3600" # 1 hour
}

variable "assessment_event_subscription" {
  type = map(object({
    event     = string
    topic_arn = string
  }))
  description = "Configures sending notifications about a specified assessment template event to a designated SNS topic"
  default     = {}
}

variable "schedule_expression" {
  type        = string
  description = <<-DOC
    An AWS Schedule Expression to indicate how often the scheduled event shoud run.

    For more information see:
    https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html
  DOC
  #default     = "rate(1 day)"
  default = "rate(5 minutes)"
}


variable "aws_cloudwatch_event_rule_name" {
  type        = string
  description = "AWS Inspector cloudwatch event rule name"
  default     = "" 
}
variable "event_rule_description" {
  type        = string
  description = "A description of the CloudWatch event rule"
  default     = "Trigger an AWS Inspector Assessment"
}

variable "enabled_rules" {
  type        = list(string)
  description = <<-DOC
    A list of AWS Inspector rules that should run on a periodic basis.

    Valid values are `cve`, `cis`, `nr`, `sbp` which map to the appropriate [Inspector rule arns by region](https://docs.aws.amazon.com/inspector/latest/userguide/inspector_rules-arns.html).
  DOC
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
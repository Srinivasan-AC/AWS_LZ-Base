################################################################################
# Firewall
################################################################################

resource "aws_networkfirewall_firewall" "this" {
  count = var.create ? 1 : 0

  delete_protection = var.delete_protection
  description       = var.description

  dynamic "encryption_configuration" {
    for_each = length(var.encryption_configuration) > 0 ? [var.encryption_configuration] : []

    content {
      key_id = try(encryption_configuration.value.key_id, null)
      type   = encryption_configuration.value.type
    }
  }

  firewall_policy_arn               = var.firewall_policy_arn
  firewall_policy_change_protection = var.firewall_policy_change_protection
  name                              = var.name
  subnet_change_protection          = var.subnet_change_protection

  dynamic "subnet_mapping" {
    for_each = values(var.subnet_mapping)

    content {
      subnet_id       = subnet_mapping.value.subnet_id
      ip_address_type = "IPV4"
    }
  }

  vpc_id = var.vpc_id

  tags = var.tags
}

################################################################################
# Logging Configuration
################################################################################

resource "aws_networkfirewall_logging_configuration" "this" {
  count = var.create && var.create_logging_configuration ? 1 : 0

  firewall_arn = aws_networkfirewall_firewall.this[0].arn

  logging_configuration {
    # At least one config, at most, only two blocks can be specified; one for `FLOW` logs and one for `ALERT` logs.
    dynamic "log_destination_config" {
      for_each = var.logging_configuration_destination_config
      content {
        log_destination      = log_destination_config.value.log_destination
        log_destination_type = log_destination_config.value.log_destination_type
        log_type             = log_destination_config.value.log_type
      }
    }
  }
}

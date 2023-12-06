# module "config_logs" {
#   source = "./modules/aws-s3-bucket"

#   bucket_name   = var.config_logs_bucket
#   force_destroy = var.force_destroy
# }

# module "managed_rules" {
#   source = "./modules/aws-config"

#   organization_managed = var.organization_managed
#   config_logs_bucket   = module.config_logs.bucket_id
#   config_logs_prefix   = var.config_logs_prefix
#   # You can exclude AWS accounts when deploying Organization rules
#   # excluded_accounts = [
#   #   "123456789012",
#   # ]
#   rule_packs            = var.rule_packs
#   rule_packs_to_exclude = var.rule_packs_to_exclude
#   # Extra rules not included in the Packs you want to deploy
#   rules_to_include         = var.rules_to_include
#   rules_to_exclude         = var.rules_to_exclude
#   required_tags_parameters = var.required_tags_parameters
#   #   redshift_cluster_maintenancesettings_check_parameters = {
#   #     allowVersionUpgrade = true
#   #   }

# }
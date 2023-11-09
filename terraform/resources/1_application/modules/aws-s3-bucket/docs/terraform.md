<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.9.0 |
| <a name="provider_time"></a> [time](#provider\_time) | >= 0.7 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_user"></a> [s3\_user](#module\_s3\_user) | cloudposse/iam-s3-user/aws | 1.2.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_accelerate_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) | resource |
| [aws_s3_bucket_acl.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_object_lock_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration) | resource |
| [aws_s3_bucket_ownership_controls.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_bucket_website_configuration.redirect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [time_sleep.wait_for_aws_s3_bucket_settings](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_canonical_user_id.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_iam_policy_document.aggregated_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication_sts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_enabled"></a> [access\_key\_enabled](#input\_access\_key\_enabled) | Set to `true` to create an IAM Access Key for the created IAM user | `bool` | `true` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | The [canned ACL](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl) to apply.<br>Deprecated by AWS in favor of bucket policies.<br>Automatically disabled if `s3_object_ownership` is set to "BucketOwnerEnforced".<br>Defaults to "private" for backwards compatibility, but we recommend setting `s3_object_ownership` to "BucketOwnerEnforced" instead. | `string` | `"private"` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_allow_encrypted_uploads_only"></a> [allow\_encrypted\_uploads\_only](#input\_allow\_encrypted\_uploads\_only) | Set to `true` to prevent uploads of unencrypted objects to S3 bucket | `bool` | `false` | no |
| <a name="input_allow_ssl_requests_only"></a> [allow\_ssl\_requests\_only](#input\_allow\_ssl\_requests\_only) | Set to `true` to require requests to use Secure Socket Layer (HTTPS/SSL). This will explicitly deny access to HTTP requests | `bool` | `false` | no |
| <a name="input_allowed_bucket_actions"></a> [allowed\_bucket\_actions](#input\_allowed\_bucket\_actions) | List of actions the user is permitted to perform on the S3 bucket | `list(string)` | <pre>[<br>  "s3:PutObject",<br>  "s3:PutObjectAcl",<br>  "s3:GetObject",<br>  "s3:DeleteObject",<br>  "s3:ListBucket",<br>  "s3:ListBucketMultipartUploads",<br>  "s3:GetBucketLocation",<br>  "s3:AbortMultipartUpload"<br>]</pre> | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Set to `false` to disable the blocking of new public access lists on the bucket | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Set to `false` to disable the blocking of new public policies on the bucket | `bool` | `true` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Set this to true to use Amazon S3 Bucket Keys for SSE-KMS, which may or may not reduce the number of AWS KMS requests.<br>For more information, see: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-key.html | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name. If provided, the bucket will be created with this name instead of generating the name from the context | `string` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_cors_configuration"></a> [cors\_configuration](#input\_cors\_configuration) | Specifies the allowed headers, methods, origins and exposed headers when using CORS on this bucket | <pre>list(object({<br>    id              = optional(string)<br>    allowed_headers = optional(list(string))<br>    allowed_methods = optional(list(string))<br>    allowed_origins = optional(list(string))<br>    expose_headers  = optional(list(string))<br>    max_age_seconds = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When `true`, permits a non-empty S3 bucket to be deleted by first deleting all objects in the bucket.<br>THESE OBJECTS ARE NOT RECOVERABLE even if they were versioned and stored in Glacier. | `bool` | `false` | no |
| <a name="input_grants"></a> [grants](#input\_grants) | A list of policy grants for the bucket, taking a list of permissions.<br>Conflicts with `acl`. Set `acl` to `null` to use this.<br>Deprecated by AWS in favor of bucket policies.<br>Automatically disabled if `s3_object_ownership` is set to "BucketOwnerEnforced". | <pre>list(object({<br>    id          = string<br>    type        = string<br>    permissions = list(string)<br>    uri         = string<br>  }))</pre> | `[]` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Set to `false` to disable the ignoring of public access lists on the bucket | `bool` | `true` | no |
| <a name="input_kms_master_key_arn"></a> [kms\_master\_key\_arn](#input\_kms\_master\_key\_arn) | The AWS KMS master key ARN used for the `SSE-KMS` encryption. This can only be used when you set the value of `sse_algorithm` as `aws:kms`. The default aws/s3 AWS KMS master key is used if this element is absent while the `sse_algorithm` is `aws:kms` | `string` | `""` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_lifecycle_configuration_rules"></a> [lifecycle\_configuration\_rules](#input\_lifecycle\_configuration\_rules) | A list of lifecycle V2 rules | <pre>list(object({<br>    enabled = optional(bool, true)<br>    id      = string<br><br>    abort_incomplete_multipart_upload_days = optional(number)<br><br>    # `filter_and` is the `and` configuration block inside the `filter` configuration.<br>    # This is the only place you should specify a prefix.<br>    filter_and = optional(object({<br>      object_size_greater_than = optional(number) # integer >= 0<br>      object_size_less_than    = optional(number) # integer >= 1<br>      prefix                   = optional(string)<br>      tags                     = optional(map(string), {})<br>    }))<br>    expiration = optional(object({<br>      date                         = optional(string) # string, RFC3339 time format, GMT<br>      days                         = optional(number) # integer > 0<br>      expired_object_delete_marker = optional(bool)<br>    }))<br>    noncurrent_version_expiration = optional(object({<br>      newer_noncurrent_versions = optional(number) # integer > 0<br>      noncurrent_days           = optional(number) # integer >= 0<br>    }))<br>    transition = optional(list(object({<br>      date          = optional(string) # string, RFC3339 time format, GMT<br>      days          = optional(number) # integer > 0<br>      storage_class = optional(string)<br>      # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.<br>    })), [])<br><br>    noncurrent_version_transition = optional(list(object({<br>      newer_noncurrent_versions = optional(number) # integer >= 0<br>      noncurrent_days           = optional(number) # integer >= 0<br>      storage_class             = optional(string)<br>      # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.<br>    })), [])<br>  }))</pre> | `[]` | no |
| <a name="input_lifecycle_rule_ids"></a> [lifecycle\_rule\_ids](#input\_lifecycle\_rule\_ids) | DEPRECATED (use `lifecycle_configuration_rules`): A list of IDs to assign to corresponding `lifecycle_rules` | `list(string)` | `[]` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | DEPRECATED (`use lifecycle_configuration_rules`): A list of lifecycle rules | <pre>list(object({<br>    prefix  = string<br>    enabled = bool<br>    tags    = map(string)<br><br>    enable_glacier_transition            = bool<br>    enable_deeparchive_transition        = bool<br>    enable_standard_ia_transition        = bool<br>    enable_current_object_expiration     = bool<br>    enable_noncurrent_version_expiration = bool<br><br>    abort_incomplete_multipart_upload_days         = number<br>    noncurrent_version_glacier_transition_days     = number<br>    noncurrent_version_deeparchive_transition_days = number<br>    noncurrent_version_expiration_days             = number<br><br>    standard_transition_days    = number<br>    glacier_transition_days     = number<br>    deeparchive_transition_days = number<br>    expiration_days             = number<br>  }))</pre> | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Bucket access logging configuration. Empty list for no logging, list of 1 to enable logging. | <pre>list(object({<br>    bucket_name = string<br>    prefix      = string<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_object_lock_configuration"></a> [object\_lock\_configuration](#input\_object\_lock\_configuration) | A configuration for S3 object locking. With S3 Object Lock, you can store objects using a `write once, read many` (WORM) model. Object Lock can help prevent objects from being deleted or overwritten for a fixed amount of time or indefinitely. | <pre>object({<br>    mode  = string # Valid values are GOVERNANCE and COMPLIANCE.<br>    days  = number<br>    years = number<br>  })</pre> | `null` | no |
| <a name="input_privileged_principal_actions"></a> [privileged\_principal\_actions](#input\_privileged\_principal\_actions) | List of actions to permit `privileged_principal_arns` to perform on bucket and bucket prefixes (see `privileged_principal_arns`) | `list(string)` | `[]` | no |
| <a name="input_privileged_principal_arns"></a> [privileged\_principal\_arns](#input\_privileged\_principal\_arns) | List of maps. Each map has a key, an IAM Principal ARN, whose associated value is<br>a list of S3 path prefixes to grant `privileged_principal_actions` permissions for that principal,<br>in addition to the bucket itself, which is automatically included. Prefixes should not begin with '/'. | `list(map(list(string)))` | `[]` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_replication_rules"></a> [replication\_rules](#input\_replication\_rules) | DEPRECATED (use `s3_replication_rules`): Specifies the replication rules for S3 bucket replication if enabled. You must also set s3\_replication\_enabled to true. | `list(any)` | `null` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Set to `false` to disable the restricting of making the bucket public | `bool` | `true` | no |
| <a name="input_s3_object_ownership"></a> [s3\_object\_ownership](#input\_s3\_object\_ownership) | Specifies the S3 object ownership control.<br>Valid values are `ObjectWriter`, `BucketOwnerPreferred`, and 'BucketOwnerEnforced'.<br>Defaults to "ObjectWriter" for backwards compatibility, but we recommend setting "BucketOwnerEnforced" instead. | `string` | `"ObjectWriter"` | no |
| <a name="input_s3_replica_bucket_arn"></a> [s3\_replica\_bucket\_arn](#input\_s3\_replica\_bucket\_arn) | A single S3 bucket ARN to use for all replication rules.<br>Note: The destination bucket can be specified in the replication rule itself<br>(which allows for multiple destinations), in which case it will take precedence over this variable. | `string` | `""` | no |
| <a name="input_s3_replication_enabled"></a> [s3\_replication\_enabled](#input\_s3\_replication\_enabled) | Set this to true and specify `s3_replication_rules` to enable replication. `versioning_enabled` must also be `true`. | `bool` | `false` | no |
| <a name="input_s3_replication_permissions_boundary_arn"></a> [s3\_replication\_permissions\_boundary\_arn](#input\_s3\_replication\_permissions\_boundary\_arn) | Permissions boundary ARN for the created IAM replication role. | `string` | `null` | no |
| <a name="input_s3_replication_rules"></a> [s3\_replication\_rules](#input\_s3\_replication\_rules) | Specifies the replication rules for S3 bucket replication if enabled. You must also set s3\_replication\_enabled to true. | <pre>list(object({<br>    id       = optional(string)<br>    priority = optional(number)<br>    prefix   = optional(string)<br>    status   = optional(string, "Enabled")<br>    # delete_marker_replication { status } had been flattened for convenience<br>    delete_marker_replication_status = optional(string, "Disabled")<br>    # Add the configuration as it appears in the resource, for consistency<br>    # this nested version takes precedence if both are provided.<br>    delete_marker_replication = optional(object({<br>      status = string<br>    }))<br><br>    # destination_bucket is specified here rather than inside the destination object because before optional<br>    # attributes, it made it easier to work with the Terraform type system and create a list of consistent type.<br>    # It is preserved for backward compatibility, but the nested version takes priority if both are provided.<br>    destination_bucket = optional(string) # destination bucket ARN, overrides s3_replica_bucket_arn<br><br>    destination = object({<br>      bucket        = optional(string) # destination bucket ARN, overrides s3_replica_bucket_arn<br>      storage_class = optional(string, "STANDARD")<br>      # replica_kms_key_id at this level is for backward compatibility, and is overridden by the one in `encryption_configuration`<br>      replica_kms_key_id = optional(string, "")<br>      encryption_configuration = optional(object({<br>        replica_kms_key_id = string<br>      }))<br>      access_control_translation = optional(object({<br>        owner = string<br>      }))<br>      # account_id is for backward compatibility, overridden by account<br>      account_id = optional(string)<br>      account    = optional(string)<br>      # For convenience, specifying either metrics or replication_time enables both<br>      metrics = optional(object({<br>        event_threshold = optional(object({<br>          minutes = optional(number, 15) # Currently 15 is the only valid number<br>        }), { minutes = 15 })<br>        status = optional(string, "Enabled")<br>      }), { status = "Disabled" })<br>      # To preserve backward compatibility, Replication Time Control (RTC) is automatically enabled<br>      # when metrics are enabled. To enable metrics without RTC, you must explicitly configure<br>      # replication_time.status = "Disabled".<br>      replication_time = optional(object({<br>        time = optional(object({<br>          minutes = optional(number, 15) # Currently 15 is the only valid number<br>        }), { minutes = 15 })<br>        status = optional(string)<br>      }))<br>    })<br><br>    source_selection_criteria = optional(object({<br>      replica_modifications = optional(object({<br>        status = string # Either Enabled or Disabled<br>      }))<br>      sse_kms_encrypted_objects = optional(object({<br>        status = optional(string)<br>      }))<br>    }))<br>    # filter.prefix overrides top level prefix<br>    filter = optional(object({<br>      prefix = optional(string)<br>      tags   = optional(map(string), {})<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_s3_replication_source_roles"></a> [s3\_replication\_source\_roles](#input\_s3\_replication\_source\_roles) | Cross-account IAM Role ARNs that will be allowed to perform S3 replication to this bucket (for replication within the same AWS account, it's not necessary to adjust the bucket policy). | `list(string)` | `[]` | no |
| <a name="input_source_policy_documents"></a> [source\_policy\_documents](#input\_source\_policy\_documents) | List of IAM policy documents (in JSON) that are merged together into the exported document.<br>Statements defined in source\_policy\_documents must have unique SIDs.<br>Statement having SIDs that match policy SIDs generated by this module will override them. | `list(string)` | `[]` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"AES256"` | no |
| <a name="input_ssm_base_path"></a> [ssm\_base\_path](#input\_ssm\_base\_path) | The base path for SSM parameters where created IAM user's access key is stored | `string` | `"/s3_user/"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_store_access_key_in_ssm"></a> [store\_access\_key\_in\_ssm](#input\_store\_access\_key\_in\_ssm) | Set to `true` to store the created IAM user's access key in SSM Parameter Store,<br>`false` to store them in Terraform state as outputs.<br>Since Terraform state would contain the secrets in plaintext,<br>use of SSM Parameter Store is recommended. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_transfer_acceleration_enabled"></a> [transfer\_acceleration\_enabled](#input\_transfer\_acceleration\_enabled) | Set this to `true` to enable S3 Transfer Acceleration for the bucket.<br>Note: When this is set to `false` Terraform does not perform drift detection<br>and will not disable Transfer Acceleration if it was enabled outside of Terraform.<br>To disable it via Terraform, you must set this to `true` and then to `false`.<br>Note: not all regions support Transfer Acceleration. | `bool` | `false` | no |
| <a name="input_user_enabled"></a> [user\_enabled](#input\_user\_enabled) | Set to `true` to create an IAM user with permission to access the bucket | `bool` | `false` | no |
| <a name="input_user_permissions_boundary_arn"></a> [user\_permissions\_boundary\_arn](#input\_user\_permissions\_boundary\_arn) | Permission boundary ARN for the IAM user created to access the bucket. | `string` | `null` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket | `bool` | `true` | no |
| <a name="input_website_configuration"></a> [website\_configuration](#input\_website\_configuration) | Specifies the static website hosting configuration object | <pre>list(object({<br>    index_document = string<br>    error_document = string<br>    routing_rules = list(object({<br>      condition = object({<br>        http_error_code_returned_equals = string<br>        key_prefix_equals               = string<br>      })<br>      redirect = object({<br>        host_name               = string<br>        http_redirect_code      = string<br>        protocol                = string<br>        replace_key_prefix_with = string<br>        replace_key_with        = string<br>      })<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_website_redirect_all_requests_to"></a> [website\_redirect\_all\_requests\_to](#input\_website\_redirect\_all\_requests\_to) | If provided, all website requests will be redirected to the specified host name and protocol | <pre>list(object({<br>    host_name = string<br>    protocol  = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_id"></a> [access\_key\_id](#output\_access\_key\_id) | The access key ID, if `var.user_enabled && var.access_key_enabled`.<br>While sensitive, it does not need to be kept secret, so this is output regardless of `var.store_access_key_in_ssm`. |
| <a name="output_access_key_id_ssm_path"></a> [access\_key\_id\_ssm\_path](#output\_access\_key\_id\_ssm\_path) | The SSM Path under which the S3 User's access key ID is stored |
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | Bucket ARN |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | FQDN of bucket |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Bucket Name (aka ID) |
| <a name="output_bucket_region"></a> [bucket\_region](#output\_bucket\_region) | Bucket region |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | The bucket region-specific domain name |
| <a name="output_bucket_website_domain"></a> [bucket\_website\_domain](#output\_bucket\_website\_domain) | The bucket website domain, if website is enabled |
| <a name="output_bucket_website_endpoint"></a> [bucket\_website\_endpoint](#output\_bucket\_website\_endpoint) | The bucket website endpoint, if website is enabled |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Is module enabled |
| <a name="output_replication_role_arn"></a> [replication\_role\_arn](#output\_replication\_role\_arn) | The ARN of the replication IAM Role |
| <a name="output_secret_access_key"></a> [secret\_access\_key](#output\_secret\_access\_key) | The secret access key will be output if created and not stored in SSM. However, the secret access key, if created,<br>will be written to the Terraform state file unencrypted, regardless of any other settings.<br>See the [Terraform documentation](https://www.terraform.io/docs/state/sensitive-data.html) for more details. |
| <a name="output_secret_access_key_ssm_path"></a> [secret\_access\_key\_ssm\_path](#output\_secret\_access\_key\_ssm\_path) | The SSM Path under which the S3 User's secret access key is stored |
| <a name="output_user_arn"></a> [user\_arn](#output\_user\_arn) | The ARN assigned by AWS for the user |
| <a name="output_user_enabled"></a> [user\_enabled](#output\_user\_enabled) | Is user creation enabled |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | Normalized IAM user name |
| <a name="output_user_unique_id"></a> [user\_unique\_id](#output\_user\_unique\_id) | The user unique ID assigned by AWS |
<!-- markdownlint-restore -->
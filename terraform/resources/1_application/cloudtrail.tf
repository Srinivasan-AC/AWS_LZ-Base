module "cloudtrail" {
  source = "./modules/aws-cloudtrail"

  cloudtrail_enabled            = var.cloudtrail_enabled
  cloudtrail_name               = var.cloudtrail_name
  enable_logging                = var.enable_logging
  enable_log_file_validation    = var.enable_log_file_validation
  include_global_service_events = var.include_global_service_events
  is_multi_region_trail         = var.is_multi_region_trail
  is_organization_trail         = var.is_organization_trail
  s3_bucket_name                = module.s3_bucket.bucket_id
  cloudtrail_tags               = var.cloudtrail_tags

  depends_on = [module.s3_bucket, aws_s3_bucket_policy.CloudTrailS3Bucket]


}

module "s3_bucket" {
  source  = "./modules/aws-s3-bucket"
  enabled = var.enable_s3_bucket_cloudtrail

  bucket_name        = var.s3_bucket_name_cloudtrail
  force_destroy      = var.force_destroy
  versioning_enabled = var.versioning_enabled

  tags = merge(
    var.tags,
    var.s3_bucket_tags,
  )

}

resource "aws_s3_bucket_policy" "CloudTrailS3Bucket" {
  bucket     = module.s3_bucket.bucket_id
  depends_on = [module.s3_bucket]
  policy     = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name_cloudtrail}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucket_name_cloudtrail}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY  
}
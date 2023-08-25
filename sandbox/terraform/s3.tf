resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
}

# Use the `aws_s3_bucket_acl` resource to set the ACL for the bucket

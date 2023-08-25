resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
}

# Use the `aws_s3_bucket_acl` resource to set the ACL for the bucket
resource "aws_s3_bucket_acl" "sandbox_bucket_acl" {
  bucket = aws_s3_bucket.sandbox_bucket.id
  acl    = "private"
}
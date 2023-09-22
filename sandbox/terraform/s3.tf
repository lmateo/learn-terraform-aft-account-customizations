resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-${data.aws_caller_identity.current.account_id}"
}

# Use the `aws_s3_bucket_acl` resource to set the ACL for the bucket

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.sandbox_bucket.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::127311923021:root"
      },
      "Action": [ "s3:PutObject" ],
      "Resource": [
        "${aws_s3_bucket.sandbox_bucket.arn}/*"
      ]
    }
  ]
}
EOF
}
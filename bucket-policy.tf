# attaches a policy to an S3 bucket resource
resource "aws_s3_bucket_policy" "attach_policy" {

  bucket = aws_s3_bucket.web.id # bucket's name

  # policy construct
  policy = data.aws_iam_policy_document.bucket_policy.json

}

# generates an IAM policy document in JSON format for use with bucket
data "aws_iam_policy_document" "bucket_policy" {

  statement {

    sid = "AddPerm" # identifier for the policy statement

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject", ] # action to allow

    # ARN of the bucket will be of format arn:aws:s3:::bucketname
    resources = ["${aws_s3_bucket.web.arn}/*", ]

  }
  
}
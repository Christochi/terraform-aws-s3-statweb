resource "aws_s3_bucket_policy" "website_hosting" {

  bucket = aws_s3_bucket.web.id
  policy = data.aws_iam_policy_document.bucket_policy.json

}

# generates an IAM policy document in JSON format for use with bucket
data "aws_iam_policy_document" "bucket_policy" {

  statement {

    sid = "AddPerm"

    principals {
      type        = "*"
    #   identifiers = ["123456789012"]
    }

    actions = [ "s3:GetObject" ]

    resources = [
      aws_s3_bucket.web.arn,
      "${aws_s3_bucket.web.arn}/*",
    ]
  }
}
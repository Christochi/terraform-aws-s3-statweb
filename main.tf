# create S3 bucket
resource "aws_s3_bucket" "web" {

  bucket = "tochi-static-web-bucket"

  tags = {

    Name = var.bucket-tag.name

  }

}

# upload file to bucket
resource "aws_s3_object" "web_files"  {

  # iterates based on number of objects
  for_each = fileset( "/Users/christochi/Documents/tochi-webfiles/", "**" )

  bucket = aws_s3_bucket.web.id # bucket's name
  key    = each.value # object's name after uploaded

  # location of the file that will be read
  source = "/Users/christochi/Documents/tochi-webfiles/${each.value}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("/Users/christochi/Documents/tochi-webfiles/${each.value}")
  
}

# resource "aws_s3_bucket_policy" "website_hosting" {

#   bucket = aws_s3_bucket.web.id
#   policy = data.aws_iam_policy_document.bucket_policy.json

# }

# # generates an IAM policy document in JSON format for use with bucket
# data "aws_iam_policy_document" "bucket_policy" {

#   statement {

#     sid = "AddPerm"

#     principals {
#       type        = "*"
#       identifiers = ["*"]
#     }

#     actions = [ "s3:GetObject" ]

#     resources = [
#       aws_s3_bucket.web.arn,
#       "${aws_s3_bucket.web.arn}/*",
#     ]
#   }
# }



resource "aws_s3_bucket_website_configuration" "web_config" {

  bucket = aws_s3_bucket.web.id

  index_document {

    suffix = "index.html"

  }

  error_document {

    key = "error.html"

  }

}
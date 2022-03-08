# create S3 bucket
resource "aws_s3_bucket" "web" {

  bucket = var.bucket-name

  tags = {

    Name = var.bucket-tag.name

  }

}

# upload file to bucket
resource "aws_s3_object" "web_files" {

  # iterates based on number of objects
  for_each = fileset("${var.object-path}", "**")

  bucket = aws_s3_bucket.web.id # bucket's name
  key    = each.value           # object's name after uploaded

  # location of the file that will be read
  source = "${var.dir-path}/${each.value}"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("${var.dir-path}/${each.value}")

}
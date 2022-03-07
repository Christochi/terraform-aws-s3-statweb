variable "bucket-tag" {

  type        = map(string)
  description = "tag name of the S3 bucket"

  default = {

    "name" = "tochi-bucket"

  }

}

variable "bucket-tag" {

  type        = map(string)
  description = "tag name of the S3 bucket"

  default = {

    "name" = "tochi-bucket"

  }

}

variable "bucket-name" {

  type = string
  description = "name of bucket"

  default = "tochi-static-web-bucket"

}

variable "object-path" {

  type = string
  description = "location of file contents"

  default = ""

}



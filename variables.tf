variable "bucket-tag" {

  type        = map(string)
  description = "tag name of the S3 bucket"

  default = {

    "name" = "tochi-bucket"

  }

}

variable "bucket-name" {

  type        = string
  description = "name of bucket"

  default = ""

}

variable "object-path" {

  type        = string
  description = "location of file contents"

  default = ""

}

variable "dir-path" {

  type        = string
  description = "directory housing the files"

  default = ""

}
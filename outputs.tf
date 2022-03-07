output "bucket-name" {

  description = "name of bucket"
  value       = aws_s3_bucket.web.id

} 
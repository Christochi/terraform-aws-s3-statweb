output "bucket-name" {

  description = "name of bucket"
  value       = aws_s3_bucket.web.id

}

output "web-endpoint" {

  description = "s3 url of the website"
  value       = aws_s3_bucket_website_configuration.web_config.website_endpoint

}
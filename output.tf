resource "local_file" "output" {
  content  = jsonencode(aws_s3_bucket.s3_bucket) #.website_endpoint
  filename = "${path.module}/${var.output_file}"
}

resource "local_file" "domain_output" {
  content  = jsonencode(aws_route53_zone.domain_route)
  filename = "${path.module}/${var.domain_output_file}"
}

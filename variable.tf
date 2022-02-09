variable "aws_region" {
  type        = string
  description = "ap-south-1"
}

variable "s3_bucket" {
  type        = string
  description = "somthedev.com"
}

variable "domain_name" {
  type        = string
  description = "Domain Name"
}

variable "output_file" {
  type        = string
  description = "output file for final result"
}

variable "domain_output_file" {
  type = string
  description = "Domain Route 53 output"
}
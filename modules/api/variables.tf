variable "datacenter" { type = string }
variable "ecr_registry" { type = string }
variable "image_tag" { type = string }
variable "aspnetcore_environment" { type = string }
variable "host_ip" { type = string }
variable "notify_port" { type = number }
variable "db_user" { type = string }
variable "db_password" {
  type      = string
  sensitive = true
}
variable "notify_db_name" { type = string }
variable "notify_db_port" { type = number }
variable "aws_region" { type = string }
variable "aws_access_key_id" {
  type      = string
  sensitive = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}

variable "ses_smtp_host" {
  type        = string
  description = "Amazon SES SMTP endpoint"
}

variable "ses_smtp_port" {
  type        = number
  description = "Amazon SES SMTP port using STARTTLS"
}

variable "ses_smtp_username" {
  type        = string
  sensitive   = true
  description = "Amazon SES SMTP username"
}

variable "ses_smtp_password" {
  type        = string
  sensitive   = true
  description = "Amazon SES SMTP password"
}

variable "ses_from_address" {
  type        = string
  description = "Verified Amazon SES sender email address"
}

variable "ses_from_name" {
  type        = string
  description = "Display name used for Spinoza email notifications"
}
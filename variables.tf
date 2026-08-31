variable "nomad_address" { type = string }
variable "datacenter" { type = string }
variable "aws_account_id" { type = string }
variable "aws_region" { type = string }
variable "cloudflare_tunnel_token" {
  type      = string
  sensitive = true
}
variable "host_ip" {
  type        = string
  description = "Target host IP address for the notify database"
}
variable "db_password" {
  type        = string
  sensitive   = true
  description = "PostgreSQL password for spinoza-notify"
}
variable "notify_db_port" {
  type        = number
  default     = 5462
  description = "PostgreSQL port for spinoza-notify"
}
variable "image_tag" { type = string }
variable "aspnetcore_environment" { type = string }
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
  default     = "email-smtp.ap-northeast-1.amazonaws.com"
  description = "Amazon SES SMTP endpoint"
}

variable "ses_smtp_port" {
  type        = number
  default     = 587
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
  default     = "Spinoza"
  description = "Display name used for Spinoza email notifications"
}

variable "datacenter" { type = string }
variable "ecr_registry" { type = string }
variable "cloudflare_tunnel_token" {
  type      = string
  sensitive = true
}
variable "host_ip" { type = string }
variable "notify_port" { type = number }

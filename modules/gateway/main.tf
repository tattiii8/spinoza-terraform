resource "nomad_variable" "gateway" {
  path = "nomad/jobs/spinoza-gateway"

  items = {
    CLOUDFLARE_TUNNEL_TOKEN = var.cloudflare_tunnel_token
    HOST_IP                 = var.host_ip
    NOTIFY_PORT              = tostring(var.notify_port)
  }
}

resource "nomad_job" "spinoza_gateway" {
  jobspec = templatefile("${path.module}/templates/spinoza-gateway.nomad.hcl.tpl", {
    datacenter   = var.datacenter
    ecr_registry = var.ecr_registry
  })

  depends_on = [nomad_variable.gateway]
}

resource "nomad_variable" "notify" {
  path = "nomad/jobs/spinoza-notify"

  items = {
    ASPNETCORE_ENVIRONMENT               = var.aspnetcore_environment
    ASPNETCORE_URLS                      = "http://+:${tostring(var.notify_port)}"
    ConnectionStrings__DefaultConnection = "Host=${var.host_ip};Port=${tostring(var.notify_db_port)};Database=${var.notify_db_name};Username=${var.db_user};Password=${var.db_password}"
    AWS__Region                          = var.aws_region
    AWS_ACCESS_KEY_ID                    = var.aws_access_key_id
    AWS_SECRET_ACCESS_KEY                = var.aws_secret_access_key
    SES_SMTP_HOST                        = var.ses_smtp_host
    SES_SMTP_PORT                        = tostring(var.ses_smtp_port)
    SES_SMTP_USERNAME                    = var.ses_smtp_username
    SES_SMTP_PASSWORD                    = var.ses_smtp_password
    SES_FROM_ADDRESS                     = var.ses_from_address
    SES_FROM_NAME                        = var.ses_from_name
  }
}

resource "nomad_job" "spinoza_notify" {
  jobspec = templatefile("${path.module}/templates/spinoza-notify.nomad.hcl.tpl", {
    datacenter   = var.datacenter
    ecr_registry = var.ecr_registry
    image_tag    = var.image_tag
    notify_port   = var.notify_port
  })

  depends_on = [nomad_variable.notify]
}

resource "nomad_variable" "notify_db" {
  path = "nomad/jobs/spinoza-notify-db"

  items = {
    POSTGRES_USER     = var.db_user
    POSTGRES_PASSWORD = var.db_password
    POSTGRES_DB       = var.notify_db_name
  }
}

resource "nomad_job" "spinoza_notify_db" {
  jobspec = templatefile("${path.module}/templates/spinoza-notify-db.nomad.hcl.tpl", {
    datacenter    = var.datacenter
    ecr_registry  = var.ecr_registry
    notify_db_port = var.notify_db_port
  })

  depends_on = [nomad_variable.notify_db]
}

job "spinoza-db" {
  datacenters = ["${datacenter}"]
  type        = "service"

  group "spinoza-notify" {
    count = 1

    network {
      mode = "bridge"

      port "db" {
        static = ${notify_db_port}
        to     = 5432
      }
    }

    task "spinoza-notify" {
      driver = "docker"

      config {
        image = "${ecr_registry}/spinoza-db:16-alpine"
        ports = ["db"]
        args  = ["-c", "log_statement=all"]
      }

      template {
        data = <<EOF
{{ with nomadVar "nomad/jobs/spinoza-notify-db" }}
{{ range $k, $v := . }}
{{ $k }}="{{ $v }}"
{{ end }}
{{ end }}
EOF
        destination = "secrets/env"
        env         = true
      }
    }
  }
}


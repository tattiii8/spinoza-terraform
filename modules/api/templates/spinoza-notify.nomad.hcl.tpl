job "spinoza-drive" {
  datacenters = ["${datacenter}"]
  type        = "service"

  group "api" {
    count = 1

    network {
      port "http" { static = ${drive_port} }
    }

    task "spinoza-drive" {
      driver = "docker"

      config {
        image      = "${ecr_registry}/spinoza-drive:${image_tag}"
        ports      = ["http"]
        force_pull = true
      }

      template {
        data = <<EOF
{{ with nomadVar "nomad/jobs/spinoza-drive" }}
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

target "docker-metadata-action" {}

variable "APP" {
  default = "adoverseas"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=woodleighschool/ADOverseas
  default = "1.2.1"
}

variable "SOURCE" {
  default = "https://github.com/woodleighschool/ADOverseas"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64"
  ]
}

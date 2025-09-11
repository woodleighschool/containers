target "docker-metadata-action" {}

variable "APP" {
  default = "updateuserinfo"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=woodleighschool/SetRecoveryPassword
  default = "2.0.4"
}

variable "SOURCE" {
  default = "https://github.com/woodleighschool/UpdateUserInfo"
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

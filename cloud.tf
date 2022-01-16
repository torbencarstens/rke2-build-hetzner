terraform {
  cloud {
    organization = "torbencarstens"
    workspaces {
      name = "rke2-build-hetzner"
    }
  }
}

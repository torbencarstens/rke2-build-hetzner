terraform {
  cloud {
    organization = "torbencarstens"
    workspaces {
      name = "hetzner-kubernetes-base"
    }
  }
}

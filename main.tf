module "clusterbase" {
  clustername  = var.clustername
  source       = "./clusterbase"
  hcloud_token = var.hcloud_token
}
module "masterpool" {
  source              = "./masterpool"
  hcloud_token        = var.hcloud_token
  clustername         = var.clustername
  lb_ip               = module.clusterbase.lb_ip
  lb_external_v4      = module.clusterbase.lb_ipv4
  lb_external_v6      = module.clusterbase.lb_ipv6
  ssh_keys            = [hcloud_ssh_key.root.name]
  network_id          = module.clusterbase.network_id
  lb_id               = module.clusterbase.lb_id
  master_count        = 2
}
module "agentpool" {
  source              = "./agentpool"
  hcloud_token        = var.hcloud_token
  clustername         = var.clustername
  lb_ip               = module.clusterbase.lb_ip
  ssh_keys            = [hcloud_ssh_key.root.name]
  network_id          = module.clusterbase.network_id
  lb_id               = module.clusterbase.lb_id
  agent_count         = 1
}

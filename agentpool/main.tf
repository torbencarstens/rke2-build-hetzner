resource "hcloud_server" "agent" {
  count       = var.agent_count
  name        = "${var.clustername}-agent-${count.index}"
  location    = var.location
  image       = "debian-11"
  server_type = var.agent_type
  labels = {
    cluster : var.clustername,
    agent : "true"
  }
  backups  = true
  ssh_keys = var.ssh_keys
  user_data = templatefile("${path.module}/agent_userdata.tmpl", {
    extra_ssh_keys      = var.extra_ssh_keys,
  })
}

resource "hcloud_server_network" "agent" {
  count      = var.agent_count
  server_id  = hcloud_server.agent[count.index].id
  network_id = var.network_id
}

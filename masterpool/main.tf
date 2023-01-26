resource "hcloud_server" "master" {
  count       = var.master_count
  name        = "${var.clustername}-master-${count.index}"
  location    = var.location
  image       = "debian-11"
  server_type = var.master_type
  labels = {
    cluster : var.clustername,
    master : "true"
  }
  backups  = true
  ssh_keys = var.ssh_keys
  user_data = templatefile("${path.module}/server_userdata.tmpl", {
    extra_ssh_keys      = var.extra_ssh_keys,
  })
}

resource "hcloud_server_network" "master" {
  count      = var.master_count
  server_id  = hcloud_server.master[count.index].id
  network_id = var.network_id
}

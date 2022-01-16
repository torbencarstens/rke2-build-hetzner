resource "hcloud_ssh_key" "root" {
  name       = "root"
  public_key = var.ssh_pub_key
}

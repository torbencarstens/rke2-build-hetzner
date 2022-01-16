resource "hcloud_ssh_key" "root" {
  name = "root"
  public_key = file("~/.ssh/hetzner.pub")
}

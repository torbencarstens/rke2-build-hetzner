variable "ssh_pub_key" {
  type        = string
  description = "public key which is deployed on all servers"
}
variable "clustername" {
  type        = string
  description = "name of the cluster"
}
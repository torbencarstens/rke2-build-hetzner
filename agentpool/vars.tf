variable "ssh_keys" {
  type        = list(any)
  description = "ssh key names"
}
variable "clustername" {
  type        = string
  description = "name of the cluster"
}
variable "agent_count" {
  default     = 1
  description = "Count of rke2 agent servers"
}
variable "agent_type" {
  type        = string
  default     = "cpx21"
  description = "machine type to use for the agents"
}
variable "extra_ssh_keys" {
  type        = list(any)
  default     = []
  description = "Extra ssh keys to inject into Rancher instances"
}
variable "location" {
  type        = string
  default     = "nbg1"
  description = "hetzner location"
}
variable "lb_ip" {
  type        = string
  description = "ip of the lb to use to connect agents"
}
variable "lb_id" {
  type        = string
  description = "id of the load balancer to connect masters"
}
variable "network_id" {
  type        = string
  description = "network id to put servers into"
}

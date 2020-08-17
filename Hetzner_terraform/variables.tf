variable "hcloud_token" {
  default = ""
}

variable "net_name" {
  default = "k8s-net"
}

variable "net_ip_range" {
  default = "10.10.0.0/16"
}

variable "subnet_type" {
  default = "cloud"
}

variable "network_zone" {
  default = "eu-central"
}

variable "subnet_ip_range" {
  default = "10.10.1.0/16"
}

variable "SSH_Public_Key_name" {
  default = "k8s_key"
}

variable "SSH_Public_Key_Path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "masters_name" {
  default = "k8s-master"
}

variable "server_workers_name" {
  default = "k8s-worker"
}

variable "name_haproxy_server" {
  default = "haproxy"
}

variable "image" {
  default = "ubuntu-18.04"
}

variable "server_type_for_workers" {
  default = "cx11"
}

variable "server_type_for_haproxy" {
  default = "cx11"
}

variable "server_type_for_masters" {
  default = "cpx11"
}

variable "privet_key" {
  default = "~/.ssh/id_rsa"
}

variable "secondary_master_nodes_count" {
  default = "2"
}

variable "worker_nodes_count" {
  default = "3"
}

locals {
  ip_of_instences_sec_masters = "${hcloud_server.sec_masters[*].ipv4_address}"
}

locals {
  ip_of_instences_workers = "${hcloud_server.workers[*].ipv4_address}"
}

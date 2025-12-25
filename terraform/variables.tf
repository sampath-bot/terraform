variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "node_vm_size" {
  type = string
}

variable "min_node_count" {
  type = number
}

variable "max_node_count" {
  type = number
}

variable "tags" {
  type = map(string)
}

resource_group_name = "rg-c2s-raj-poc-dev-001"
aks_name            = "kubernetes-dev01"
dns_prefix          = "kubernetes-dev-dns"
kubernetes_version  = "1.33.5"

node_vm_size   = "Standard_D2alds_v6"
min_node_count = 1
max_node_count = 4

tags = {
  "Created By" = "sampath.v@c2stechs.com"
  "Environment" = "dev"
}

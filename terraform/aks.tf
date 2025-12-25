resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version        = var.kubernetes_version
  sku_tier                  = "Free"
  role_based_access_control_enabled = true
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name                = "kubercicd01"
    vm_size             = var.node_vm_size
    enable_auto_scaling = true
    min_count           = var.min_node_count
    max_count           = var.max_node_count
    max_pods            = 110
    os_disk_size_gb     = 128
    type                = "VirtualMachineScaleSets"
    zones               = ["1", "2", "3"]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
    service_cidr        = "10.0.0.0/16"
    dns_service_ip      = "10.0.0.10"
    pod_cidr            = "10.244.0.0/16"
    outbound_type       = "loadBalancer"
  }

  tags = var.tags
}

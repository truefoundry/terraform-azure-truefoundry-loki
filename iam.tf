resource "azurerm_user_assigned_identity" "loki" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = local.loki_unique_name
}

# https://azure.github.io/azure-workload-identity/docs/quick-start.html
resource "azurerm_federated_identity_credential" "loki" {
  name                = local.loki_unique_name
  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.cluster_oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.loki.id
  subject             = "system:serviceaccount:${var.loki_namespace}:${var.loki_svc_acc}"
}

resource "azurerm_storage_account" "loki" {
  name                     = replace(local.loki_unique_name, "-", "")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_container" "loki" {
  name                  = local.loki_unique_name
  storage_account_name  = azurerm_storage_account.loki.name
  container_access_type = "blob"
}

resource "azurerm_role_assignment" "storage_loki" {
  scope                = azurerm_storage_container.loki.resource_manager_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.loki.principal_id
}

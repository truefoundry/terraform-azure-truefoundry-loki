output "loki_identity_client_id" {
  value = azurerm_user_assigned_identity.loki.client_id
}

output "loki_container_id" {
  value = azurerm_storage_container.loki.id
}

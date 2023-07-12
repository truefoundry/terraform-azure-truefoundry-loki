locals {
  loki_unique_name = substr("loki-${var.cluster_name}", 0, 20)
  tags = merge(
    {
      "terraform-module" = "cluster-app-loki"
      "terraform"        = "true"
    },
    var.tags
  )
}
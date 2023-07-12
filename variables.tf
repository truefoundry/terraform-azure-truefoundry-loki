variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the cluster"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "The oidc url of the eks cluster"
  type        = string
}

variable "loki_svc_acc" {
  description = "The k8s loki service account name"
  type        = string
}

variable "loki_namespace" {
  description = "The k8s loki namespace"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Tags common to all the resources created"
}

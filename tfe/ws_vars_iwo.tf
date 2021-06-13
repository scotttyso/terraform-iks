#__________________________________________________________
#
# IKS kube_config Workspace
#__________________________________________________________

variable "ws_kube" {
  default     = "kube"
  description = "Intersight Kubernetes Service kube_config Workspace Name"
  type        = string
}

#__________________________________________________________
#
# Terraform Cloud Workspace Variables: iwo
#__________________________________________________________

module "tfc_variables_apps" {
  source = "../../../terraform-cloud/modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id[3]
  variable_list = [
    {
      description = "Terraform Cloud Organization."
      hcl         = false
      key         = "tfc_organization"
      sensitive   = false
      value       = var.tfc_organization
    },
    {
      description = "global_vars Workspace."
      hcl         = false
      key         = "ws_global_vars"
      sensitive   = false
      value       = "${var.cluster_name}_global_vars"
    },
    {
      description = "Intersight Kubernetes Service kube_config Workspace."
      hcl         = false
      key         = "ws_kube"
      sensitive   = false
      value       = "${var.cluster_name}_kube"
    },
  ]
}
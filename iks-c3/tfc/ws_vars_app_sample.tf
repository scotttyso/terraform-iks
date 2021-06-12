module "tfc_variables_app_sample" {
  source = "../../../terraform-cloud/modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id[4]
  variable_list = [
    {
      description = "Terraform Cloud Organization."
      hcl         = false
      key         = "tfc_organization"
      sensitive   = false
      value       = var.tfc_organization
    },
    {
      description = "iks_cluster Workspace."
      hcl         = false
      key         = "ws_iks_cluster"
      sensitive   = false
      value       = "${var.cluster_name}_iks_cluster"
    },
  ]
}
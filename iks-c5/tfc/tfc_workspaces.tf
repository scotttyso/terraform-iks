#__________________________________________________________
#
# Terraform Cloud Workspaces
#__________________________________________________________

module "tfc_workspaces" {
  source = "../../../terraform-cloud/modules/tfc_workspaces"
  depends_on = [
    module.tfc_agent_pool
  ]
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_organization
  workspace_list = [
    {
      auto_apply          = true
      agent_pool          = ""
      description         = "Global Variables Workspace"
      exec_mode           = "remote"
      global_remote_state = true
      name                = "${var.cluster_name}_global_vars"
      queue_all_runs      = false
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_dir         = "${var.cluster_name}/global_vars"
    },
    {
      auto_apply          = true
      agent_pool          = ""
      description         = "Intersight Kubernetes Service Workspace"
      exec_mode           = "remote"
      global_remote_state = true
      name                = "${var.cluster_name}_iks"
      queue_all_runs      = false
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_dir         = "${var.cluster_name}/iks"
    },
    {
      auto_apply          = true
      agent_pool          = ""
      description         = "Intersight Kubernetes Service - kube_config Workspace"
      exec_mode           = "remote"
      global_remote_state = true
      name                = "${var.cluster_name}_kube"
      queue_all_runs      = false
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_dir         = "${var.cluster_name}/kube"
    },
    {
      auto_apply          = true
      agent_pool          = module.tfc_agent_pool.tfc_agent_pool
      description         = "Sample Application Workspace"
      exec_mode           = "agent"
      global_remote_state = false
      name                = "${var.cluster_name}_sample"
      queue_all_runs      = false
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_dir         = "${var.cluster_name}/_sample"
    },
    {
      auto_apply          = true
      agent_pool          = module.tfc_agent_pool.tfc_agent_pool
      description         = "IWO Application Workspace"
      exec_mode           = "agent"
      global_remote_state = false
      name                = "${var.cluster_name}_iwo"
      queue_all_runs      = false
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_dir         = "${var.cluster_name}/iwo"
    },
  ]
}

output "tfc_workspaces" {
  description = "Terraform Cloud Workspace ID(s)."
  value       = module.tfc_workspaces
}
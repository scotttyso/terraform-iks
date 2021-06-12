
output "iks_cluster" {
  description = "moid of the IKS Cluster."
  value       = module.iks_cluster.cluster_moid
}

output "master_profile" {
  description = "moid of the Master Node Profile."
  value       = module.master_profile.node_group_profile_moid
}

output "worker_profile" {
  description = "moid of the Worker Node Profile."
  value       = trimspace(<<-EOT
  %{if var.worker_desired_size != "0"~}${module.worker_profile.node_group_profile_moid}
  %{else~}blank
  %{endif~}
  EOT
  )
}

#---------------------------------------------------------------------------
# Wait for cluster to come up and then output the kubeconfig, if successful
#---------------------------------------------------------------------------
#output "kube_config" {
#  description = "Kubernetes Configuration File."
#  value       = module.cluster_without_worker[0].kube_config[0].kube_config
#}

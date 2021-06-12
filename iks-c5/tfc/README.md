# Workspace and Variable Creation

## Obtain tokens and keys

Follow the instructions to obtain values for the following variables:

## Terraform Cloud Variables

* TF_VAR_terraform_cloud_token
* TF_VAR_tfc_oath_token
* TF_VAR_tfc_organization
* TF_VAR_tfc_email
* TF_VAR_agent_pool
* TF_VAR_vcs_repo

## Intersight Variables

* TF_VAR_api_key
* TF_VAR_secret_key
* TF_VAR_vcs_repo

## Assign the vCenter Password from the Instructions

* TF_VAR_vsphere_password

## Generate an SSH Key

* TF_VAR_ssh_key

## Import the following Variables into your Environment before Running

* Terraform Cloud Variables

```bash
export TF_VAR_terraform_cloud_token="obtain_token"
export TF_VAR_tfc_oath_token="obtain_token"
export TF_VAR_tfc_organization="CiscoDevNet"
export TF_VAR_tfc_email="your_email"
export TF_VAR_agent_pool="your_agent_pool"
export TF_VAR_terraform_version="1.0.0"
export TF_VAR_vcs_repo="your_vcs_repo"
```

* Intersight Variables

```bash
export TF_VAR_organization="default"
export TF_VAR_api_key="your_api_key"
export TF_VAR_secret_key="your_secret_key"
```

* Global Variables

```bash
export TF_VAR_network_prefix="10.200.0"
export TF_VAR_domain_name="demo.intra"
export TF_VAR_dns_primary="100"
export TF_VAR_dns_secondary=""
```

* Kubernetes Policies Variables

```bash
export TF_VAR_ip_pool_gateway="254"
export TF_VAR_ip_pool_from="20"
export TF_VAR_k8s_pod_cidr="100.65.0.0/16"
export TF_VAR_k8s_service_cidr="100.64.0.0/16"
export TF_VAR_k8s_k8s_version="1.19.5"
export TF_VAR_unsigned_registries="[]"
export TF_VAR_tags_policies="[ { key = \"Terraform\", value = \"Module\" }, { key = \"Owner\", value = \"CiscoDevNet\" } ]"
```

* vSphere Variables

```bash
export TF_VAR_vsphere_target="210"
export TF_VAR_vsphere_password="your_vshpere_password"
export TF_VAR_vsphere_cluster="hx-demo"
export TF_VAR_vsphere_datastore="hx-demo-ds1"
export TF_VAR_vsphere_portgroup="[\"Management\"]"
export TF_VAR_vsphere_resource_pool=""
```

* Kubernetes Cluster Variables

```bash
export TF_VAR_cluster_name="sbcluster"
export TF_VAR_load_balancers="3"
export TF_VAR_ssh_user="iksadmin"
export TF_VAR_ssh_key="your_ssh_key"
export TF_VAR_master_instance_type="small"
export TF_VAR_master_desired_size="1"
export TF_VAR_master_max_size="1"
export TF_VAR_worker_instance_type="small"
export TF_VAR_worker_desired_size="0"
export TF_VAR_worker_max_size="1"
export TF_VAR_tags_cluster="[ { key = \"Terraform\", value = \"Module\" }, { key = \"Owner\", value = \"CiscoDevNet\" } ]"
```

Once all Variables have been imported into your environment run the plan:

```bash
terraform plan -out=main.plan
terraform apply main.plan
```

This module will Create the Terraform Cloud Workspace(s) and Assign the Variables to the workspace(s).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.25.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfc_agent_pool"></a> [tfc\_agent\_pool](#module\_tfc\_agent\_pool) | ../../../terraform-cloud/modules/tfc_agent_pool | n/a |
| <a name="module_tfc_variables_global"></a> [tfc\_variables\_global](#module\_tfc\_variables\_global) | ../../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_iks_cluster"></a> [tfc\_variables\_iks\_cluster](#module\_tfc\_variables\_iks\_cluster) | ../../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_iks_policies"></a> [tfc\_variables\_iks\_policies](#module\_tfc\_variables\_iks\_policies) | ../../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_workspaces"></a> [tfc\_workspaces](#module\_tfc\_workspaces) | ../../../terraform-cloud/modules/tfc_workspaces | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_pool"></a> [agent\_pool](#input\_agent\_pool) | Terraform Cloud Agent Pool. | `string` | n/a | yes |
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Intersight Kubernetes Service Cluster Name. | `string` | `"iks"` | no |
| <a name="input_dns_primary"></a> [dns\_primary](#input\_dns\_primary) | Primary DNS Server for Kubernetes Sysconfig Policy. | `string` | n/a | yes |
| <a name="input_dns_secondary"></a> [dns\_secondary](#input\_dns\_secondary) | Secondary DNS Server for Kubernetes Sysconfig Policy. | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain Name for Kubernetes Sysconfig Policy. | `string` | `"demo.intra"` | no |
| <a name="input_ip_pool_from"></a> [ip\_pool\_from](#input\_ip\_pool\_from) | IP Pool Starting IP last Octet.  The var.network\_prefix will be combined with ip\_pool\_from for the Gateway Address. | `string` | `"20"` | no |
| <a name="input_ip_pool_gateway"></a> [ip\_pool\_gateway](#input\_ip\_pool\_gateway) | IP Pool Gateway last Octet.  The var.network\_prefix will be combined with ip\_pool\_gateway for the Gateway Address. | `string` | `"254"` | no |
| <a name="input_k8s_pod_cidr"></a> [k8s\_pod\_cidr](#input\_k8s\_pod\_cidr) | Pod CIDR Block to be used to assign Pod IP Addresses. | `string` | `"100.65.0.0/16"` | no |
| <a name="input_k8s_service_cidr"></a> [k8s\_service\_cidr](#input\_k8s\_service\_cidr) | Service CIDR Block used to assign Cluster Service IP Addresses. | `string` | `"100.64.0.0/16"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes Version to Deploy. | `string` | `"1.19.5"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | Intersight Kubernetes Load Balancer count. | `string` | `3` | no |
| <a name="input_master_desired_size"></a> [master\_desired\_size](#input\_master\_desired\_size) | K8S Master Desired Cluster Size. | `string` | `1` | no |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | K8S Master Virtual Machine Instance Type.  Options are {small\|medium\|large}. | `string` | `"small"` | no |
| <a name="input_master_max_size"></a> [master\_max\_size](#input\_master\_max\_size) | K8S Master Maximum Cluster Size. | `string` | `1` | no |
| <a name="input_network_prefix"></a> [network\_prefix](#input\_network\_prefix) | IP Pool Gateway last Octet.  The var.network\_prefix will be combined with ip\_pool\_gateway for the Gateway Address. | `string` | `"10.200.0"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization. | `string` | `"default"` | no |
| <a name="input_root_ca_registries"></a> [root\_ca\_registries](#input\_root\_ca\_registries) | List of root CA Signed Registries. | `string` | `"[]"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Intersight Secret Key or file location. | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Intersight Kubernetes Service Cluster SSH Public Key. | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Intersight Kubernetes Service Cluster Default User. | `string` | `"iksadmin"` | no |
| <a name="input_tags_cluster"></a> [tags\_cluster](#input\_tags\_cluster) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_tags_policies"></a> [tags\_policies](#input\_tags\_policies) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | Token to Authenticate to the Terraform Cloud. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform Target Version. | `string` | `"1.0.0"` | no |
| <a name="input_tfc_oath_token"></a> [tfc\_oath\_token](#input\_tfc\_oath\_token) | Terraform Cloud OAuth Token for VCS\_Repo Integration. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Timezone for Kubernetes Sysconfig Policy. | `string` | `"America/New_York"` | no |
| <a name="input_unsigned_registries"></a> [unsigned\_registries](#input\_unsigned\_registries) | List of unsigned registries to be supported. | `string` | `"[]"` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | vSphere Cluster to assign the K8S Cluster Deployment. | `string` | `"hx-demo"` | no |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | vSphere Datastore to assign the K8S Cluster Deployment. | `string` | `"hx-demo-ds1"` | no |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target. | `string` | n/a | yes |
| <a name="input_vsphere_portgroup"></a> [vsphere\_portgroup](#input\_vsphere\_portgroup) | vSphere Port Group to assign the K8S Cluster Deployment. | `string` | `"Management"` | no |
| <a name="input_vsphere_resource_pool"></a> [vsphere\_resource\_pool](#input\_vsphere\_resource\_pool) | vSphere Resource Pool to assign the K8S Cluster Deployment. | `string` | `""` | no |
| <a name="input_vsphere_target"></a> [vsphere\_target](#input\_vsphere\_target) | vSphere Server registered as a Target in Intersight.  The default, 210, only works if this is for the DevNet Sandbox. | `string` | n/a | yes |
| <a name="input_worker_desired_size"></a> [worker\_desired\_size](#input\_worker\_desired\_size) | K8S Worker Desired Cluster Size. | `string` | `1` | no |
| <a name="input_worker_instance_type"></a> [worker\_instance\_type](#input\_worker\_instance\_type) | K8S Worker Virtual Machine Instance Type.  Options are {small\|medium\|large}. | `string` | `"small"` | no |
| <a name="input_worker_max_size"></a> [worker\_max\_size](#input\_worker\_max\_size) | K8S Worker Maximum Cluster Size. | `string` | `4` | no |
| <a name="input_ws_global_vars"></a> [ws\_global\_vars](#input\_ws\_global\_vars) | Global Variable Workspace Name | `string` | `"global_vars"` | no |
| <a name="input_ws_iks_policies"></a> [ws\_iks\_policies](#input\_ws\_iks\_policies) | Global Variable Workspace Name | `string` | `"iks_policies"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_agent_pool"></a> [tfc\_agent\_pool](#output\_tfc\_agent\_pool) | Terraform Cloud Agent Pool ID. |
| <a name="output_tfc_workspaces"></a> [tfc\_workspaces](#output\_tfc\_workspaces) | Terraform Cloud Workspace ID(s). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
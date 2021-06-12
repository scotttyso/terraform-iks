#__________________________________________________________
#
# Terraform Cloud Organization
#__________________________________________________________

variable "tfc_organization" {
  default     = "DevNet"
  description = "Terraform Cloud Organization."
  type        = string
}


#______________________________________________
#
# Terraform Cloud global_vars Workspace
#______________________________________________

variable "ws_global_vars" {
  default     = "global_vars"
  description = "Global Variables Workspace Name."
  type        = string
}


#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "api_key" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "secret_key" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Kubernetes Policy Variables
#__________________________________________________________

#______________________________________________
#
# Kubernetes Network CIDR/System Policies
#______________________________________________

variable "cni" {
  type        = string
  description = "Supported CNI type. Currently we only support Calico.\r\n* Calico - Calico CNI plugin as described in:\r\n https://github.com/projectcalico/cni-plugin."
  default     = "Calico"
}

variable "k8s_pod_cidr" {
  default     = "100.65.0.0/16"
  description = "Pod CIDR Block to be used to assign Pod IP Addresses."
  type        = string
}

variable "k8s_service_cidr" {
  default     = "100.64.0.0/16"
  description = "Service CIDR Block used to assign Cluster Service IP Addresses."
  type        = string
}

variable "k8s_version" {
  default     = "1.19.5"
  description = "Kubernetes Version to Deploy."
  type        = string
}


#______________________________________________
#
# K8S VM Infra Policy Variables
#______________________________________________

variable "vsphere_password" {
  description = "vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target."
  sensitive   = true
  type        = string
}

variable "vsphere_cluster" {
  default     = "hx-demo"
  description = "vSphere Cluster to assign the K8S Cluster Deployment."
  type        = string
}

variable "vsphere_datastore" {
  default     = "hx-demo-ds1"
  description = "vSphere Datastore to assign the K8S Cluster Deployment."
  type        = string
}

variable "vsphere_portgroup" {
  default     = ["Management"]
  description = "vSphere Port Group to assign the K8S Cluster Deployment."
}

variable "vsphere_resource_pool" {
  default     = ""
  description = "vSphere Resource Pool to assign the K8S Cluster Deployment."
  type        = string
}

#______________________________________________
#
# Trusted Registries Variables
#______________________________________________

variable "root_ca_registries" {
  default     = []
  description = "List of root CA Signed Registries."
  type        = list(string)
}

variable "unsigned_registries" {
  default     = []
  description = "List of unsigned registries to be supported."
  type        = list(string)
}

#______________________________________________
#
# Tags to Assign to the Policies and Cluster
#______________________________________________

variable "tags" {
  default     = []
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = list(map(string))
}


#__________________________________________________________
#
# Intersight Kubernetes Service Cluster Variables
#__________________________________________________________

#______________________________________________
#
# IKS Cluster Variables
#______________________________________________

variable "load_balancers" {
  default     = 3
  description = "Intersight Kubernetes Load Balancer count."
  type        = string
}

variable "ssh_user" {
  default     = "iksadmin"
  description = "Intersight Kubernetes Service Cluster Default User."
  type        = string
}

variable "ssh_key" {
  description = "Intersight Kubernetes Service Cluster SSH Public Key."
  sensitive   = true
  type        = string
}


#______________________________________________
#
# Kubernetes Master Variables
#______________________________________________

variable "master_instance_type" {
  default     = "small"
  description = "K8S Master Virtual Machine Instance Type.  Options are {small|medium|large}."
  type        = string
}

variable "master_desired_size" {
  default     = 1
  description = "K8S Master Desired Cluster Size."
  type        = string
}

variable "master_max_size" {
  default     = 1
  description = "K8S Master Maximum Cluster Size."
  type        = string
}

#______________________________________________
#
# Kubernetes Worker Variables
#______________________________________________

variable "worker_instance_type" {
  default     = "small"
  description = "K8S Worker Virtual Machine Instance Type.  Options are {small|medium|large}."
  type        = string
}

variable "worker_desired_size" {
  default     = 0
  description = "K8S Worker Desired Cluster Size."
  type        = string
}

variable "worker_max_size" {
  default     = 4
  description = "K8S Worker Maximum Cluster Size."
  type        = string
}
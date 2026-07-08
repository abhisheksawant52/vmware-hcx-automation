variable "vsphere_server" {
  description = "vCenter server FQDN or IP for the source site."
  type        = string
}

variable "vsphere_user" {
  description = "vCenter username."
  type        = string
}

variable "vsphere_password" {
  description = "vCenter password."
  type        = string
  sensitive   = true
}

variable "allow_unverified_ssl" {
  description = "Allow self-signed vCenter certificates (lab use only)."
  type        = bool
  default     = false
}

variable "datacenter" {
  description = "Source vSphere datacenter name."
  type        = string
}

variable "site_pairing" {
  description = "HCX site pairing between the local and remote (cloud) sites."
  type = object({
    local_system_url  = string
    remote_system_url = string
    remote_username   = string
  })
}

variable "network_extensions" {
  description = "L2 networks to stretch from on-prem to the destination site."
  type = list(object({
    name            = string
    source_network  = string
    gateway_cidr    = string
    appliance_group = string
  }))
  default = []
}

variable "migration_groups" {
  description = "Groups of VMs to migrate with a chosen HCX migration type."
  type = list(object({
    name           = string
    migration_type = string # bulk | vmotion | cold | rav
    vms            = list(string)
    target_network = string
  }))
  default = []
}

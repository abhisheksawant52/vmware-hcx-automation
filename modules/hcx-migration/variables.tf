variable "datacenter_id" {
  description = "Source datacenter managed object ID."
  type        = string
}

variable "site_pairing" {
  type = object({
    local_system_url  = string
    remote_system_url = string
    remote_username   = string
  })
}

variable "network_extensions" {
  type = list(object({
    name            = string
    source_network  = string
    gateway_cidr    = string
    appliance_group = string
  }))
  default = []
}

variable "migration_groups" {
  type = list(object({
    name           = string
    migration_type = string
    vms            = list(string)
    target_network = string
  }))
  default = []
}

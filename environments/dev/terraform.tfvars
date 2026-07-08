vsphere_server       = "vcenter-dev.onprem.example.com"
vsphere_user         = "administrator@vsphere.local"
allow_unverified_ssl = true
datacenter           = "DC-Dev"

site_pairing = {
  local_system_url  = "https://hcx-dev.onprem.example.com"
  remote_system_url = "https://hcx-dev.cloud.example.com"
  remote_username   = "cloudadmin@vmc.local"
}

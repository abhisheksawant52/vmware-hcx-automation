vsphere_server       = "vcenter-prod.onprem.example.com"
vsphere_user         = "administrator@vsphere.local"
allow_unverified_ssl = false
datacenter           = "DC-Prod"

site_pairing = {
  local_system_url  = "https://hcx-prod.onprem.example.com"
  remote_system_url = "https://hcx-prod.cloud.example.com"
  remote_username   = "cloudadmin@vmc.local"
}

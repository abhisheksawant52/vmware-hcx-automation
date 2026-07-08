# Root module: looks up the source datacenter and renders the HCX site pairing,
# network extensions and migration waves into a declarative plan consumed by the
# HCX Connector REST API (HCX is not modelled by a native Terraform provider).

data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

module "hcx_migration" {
  source = "./modules/hcx-migration"

  datacenter_id      = data.vsphere_datacenter.dc.id
  site_pairing       = var.site_pairing
  network_extensions = var.network_extensions
  migration_groups   = var.migration_groups
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

# Resolve the source distributed port groups to be L2-extended.
data "vsphere_network" "source" {
  for_each = var.network_extensions

  name          = each.value.source_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "terraform_data" "extension" {
  for_each = var.network_extensions

  input = {
    network      = each.key
    source_id    = data.vsphere_network.source[each.key].id
    remote_site  = each.value.remote_site
    gateway_cidr = each.value.gateway_cidr
  }

  provisioner "local-exec" {
    command = "python \"${var.helper}\" extend-network --name \"${each.key}\" --source-network \"${each.value.source_network}\" --remote-site \"${each.value.remote_site}\" --gateway \"${each.value.gateway_cidr}\""

    environment = var.hcx_env
  }
}

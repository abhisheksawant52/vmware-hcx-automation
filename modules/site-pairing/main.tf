resource "terraform_data" "pairing" {
  for_each = var.remote_sites

  input = {
    site     = each.key
    url      = each.value.url
    username = each.value.username
  }

  provisioner "local-exec" {
    command = "python \"${var.helper}\" pair --name \"${each.key}\" --remote-url \"${each.value.url}\" --remote-user \"${each.value.username}\""

    environment = var.hcx_env
  }
}

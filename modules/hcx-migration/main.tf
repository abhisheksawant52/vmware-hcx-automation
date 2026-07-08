# Renders the HCX site pairing, network extensions and migration waves into a
# single JSON plan. A downstream automation step (CI job or operator tooling)
# applies this plan against the HCX Connector REST API.

locals {
  migration_plan = {
    sitePairing       = var.site_pairing
    networkExtensions = var.network_extensions
    migrationGroups   = var.migration_groups
  }
}

resource "local_file" "migration_plan" {
  content  = jsonencode(local.migration_plan)
  filename = "${path.root}/generated/hcx-migration-plan.json"
}

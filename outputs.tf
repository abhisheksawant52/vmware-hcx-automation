output "datacenter_id" {
  description = "Managed object ID of the source datacenter."
  value       = data.vsphere_datacenter.dc.id
}

output "migration_plan_path" {
  description = "Path to the rendered HCX migration plan document."
  value       = module.hcx_migration.migration_plan_path
}

output "network_extension_count" {
  description = "Number of L2 network extensions defined."
  value       = module.hcx_migration.network_extension_count
}

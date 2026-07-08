output "migration_plan_path" {
  description = "Path to the rendered HCX migration plan JSON."
  value       = local_file.migration_plan.filename
}

output "network_extension_count" {
  value = length(var.network_extensions)
}

output "paired_sites" {
  description = "Names of the remote sites configured for pairing."
  value       = keys(var.remote_sites)
}

variable "helper" {
  description = "Path to the HCX Python helper CLI."
  type        = string
}

variable "hcx_env" {
  description = "Environment variables (HCX credentials) passed to the helper."
  type        = map(string)
  sensitive   = true
}

variable "remote_sites" {
  description = "Remote sites to pair with, keyed by site name."
  type = map(object({
    url      = string
    username = string
  }))
}

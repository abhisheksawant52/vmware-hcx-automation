# Usage

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in your
   vCenter and HCX site details, or use an environment file under
   `environments/<env>/`.
2. Run `make init` then `make plan`.
3. `terraform apply` renders `generated/hcx-migration-plan.json`.
4. Apply the plan against the HCX Connector API using your operator tooling or a
   CI job (HCX has no native Terraform provider; the rendered JSON is the
   contract between IaC and the HCX API).

## Migration types

| Type    | Description                                  |
| ------- | -------------------------------------------- |
| bulk    | Parallel, resync-based bulk migration        |
| vmotion | Live vMotion (zero downtime, one VM at a time)|
| cold    | Powered-off migration                        |
| rav     | Replication Assisted vMotion                 |

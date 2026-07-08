.DEFAULT_GOAL := help
.PHONY: help init fmt validate plan lint clean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

init: ## terraform init (backend disabled for local checks)
	terraform init -backend=false

fmt: ## Format all Terraform
	terraform fmt -recursive

validate: init ## Validate configuration
	terraform validate

plan: ## Show an execution plan
	terraform plan

lint: ## fmt check + tflint
	terraform fmt -check -recursive
	tflint --recursive

clean: ## Remove local Terraform state/cache
	rm -rf .terraform .terraform.lock.hcl

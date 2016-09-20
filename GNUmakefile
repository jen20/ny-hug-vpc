TERRAFORM_REMOTE_STATE_NAME="jen20/ny-hug-vpc"

default: help

.PHONY: help
help:
	@echo "Valid targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

.PHONY: config
config: ## Configure Terraform Remote State Storage
	@echo "Configuring Terraform remote state ($(TERRAFORM_REMOTE_STATE_NAME))..."
	@terraform remote config \
		-backend=atlas \
		-backend-config="name=$(TERRAFORM_REMOTE_STATE_NAME)"

.PHONY: plan
plan: ## Run a Terraform plan operation - set TF_OPTS for additional flags
	terraform get $(TF_OPTS) terraform/
	terraform plan $(TF_OPTS) terraform/

.PHONY: apply
apply: ## Run a Terraform apply operation - set TF_OPTS for additional flags
	terraform apply $(TF_OPTS) terraform/

.PHONY: destroy
destroy: ## Run a Terraform destroy operation - set TF_OPTS for additional flags
	@terraform destroy $(TF_OPTS) terraform/

.PHONY: output
output: ## Show Terraform outputs - set TF_OPTS for individual fields
	@terraform output $(TF_OPTS)

.PHONY: graph
graph: ## Draw a graph of the infrastructure dependencies
	@terraform graph terraform/ | dot -Tpdf > graph.pdf

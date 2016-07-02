## Ops - VPC and Networking

**Note: This is part of the example code for the New York HUG talk by James
Nugent about deploying service-oriented architectures using HashiCorp tools. No
warranty is given.**

This repository contains Terraform code under the `terraform/` directory for
configuring a VPC in Amazon Web Services, complete with:

- Private and public subnets distributed across availability zones accessible
  by the account in use

- Internet Gateway and associated routing configuration to allow internet
  access from instances in public subnets 

- EIPs and NAT Gateways to allow internet access from instances in private
  subnets

*If running via the command line instead of via Atlas, it is important
configure Terraform remote state _first_, using `make config`. Following that,
`make plan` and `make apply` can be used to plan and apply the Terraform plans
respectively.*

# Lab 3 Terraform modules

In this lab we'll deploy a ready made module from the Terraform registry
https://registry.terraform.io/modules/hashicorp/vault/aws/0.12.2 -

![Vault Architecture](https://github.com/hashicorp/terraform-aws-vault/blob/master/_docs/architecture.png?raw=true "Vault Architecture")


1. Go to the Vault registry module  https://registry.terraform.io/modules/hashicorp/vault/aws/0.12.2
2. Copy the "Provision instructions" code into your favourite code editor and add the variables below and save it to a file myvault_lab/main.cf
```
vault_domain_name = myvault.example.com
ssh_key_name = iac_demo
create_dns_entry = 0
hosted_zone_domain_name = myvault.example.com
```
3. Navigate to the myvault_lab directory and execute the terraform init, validate, plan and apply commands
4. All being well you should see the infrastructure spinning up, take a look in the AWS EC2 and VPN consoles and review various elements of infrastructure required to implement the architecture above. Take note of the fact that this gets deployed across multiple availability zones
5. If you want to check out the module code itself, you can clone the repo from Source github link on the module registry page
6. **Don't forget to destroy the environment when finished to avoid surprise bills\!\!**

# End of Lab 3

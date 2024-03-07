### Create access package catalogs
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_catalog

locals {
  catalogs = {
    ### Catalog for development department
    dev_catalog = {
      display_name = lower("dev-catalog")
      description  = "Development catalog using Terraform"
    }
    ### Catalog for test department
    test_catalog = {
      display_name = lower("test-catalog")
      description  = "Test catalog using Terraform"
    }
  }
}
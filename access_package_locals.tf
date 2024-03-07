### Create access package catalogs
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package

locals {
  access_packages = {
    ### Access packages for development department
    dev_access_package = {
      catalog_id   = azuread_access_package_catalog.catalog["dev_catalog"].id
      display_name = lower("dev-access package")
      description  = "Test access package using Terraform"
    }
    dev_access_package2 = {
      catalog_id   = azuread_access_package_catalog.catalog["dev_catalog"].id
      display_name = lower("dev-access package 2")
      description  = "Test access package using Terraform"
    }
    ### Access packages for test department
    test_access_package = {
      catalog_id   = azuread_access_package_catalog.catalog["test_catalog"].id
      display_name = lower("test-access package")
      description  = "Test access package using Terraform"
    }
  }
}
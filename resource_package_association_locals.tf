###
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_resource_package_association

locals {
  resource_package_associations = {
    dev_resource_package_association = {
      access_package_id               = azuread_access_package.access_package["dev_access_package"].id
      catalog_resource_association_id = azuread_access_package_resource_catalog_association.catalog_association["dev_association"].id
    }
    dev_resource_package_association2 = {
      access_package_id               = azuread_access_package.access_package["dev_access_package2"].id
      catalog_resource_association_id = azuread_access_package_resource_catalog_association.catalog_association["dev_association2"].id
    }
    test_resource_package_association = {
      access_package_id               = azuread_access_package.access_package["test_access_package"].id
      catalog_resource_association_id = azuread_access_package_resource_catalog_association.catalog_association["test_association"].id
    }
  }
}
### Associate resources to catalogs
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_resource_catalog_association

locals {
  catalog_associations = {
    ### Resources associated with development department catalog
    dev_association = {
      catalog_id             = azuread_access_package_catalog.catalog["dev_catalog"].id
      resource_origin_id     = azuread_group.group["dev_resources"].object_id
      resource_origin_system = "AadGroup"
    }
    dev_association2 = {
      catalog_id             = azuread_access_package_catalog.catalog["dev_catalog"].id
      resource_origin_id     = azuread_group.group["dev_resources2"].object_id
      resource_origin_system = "AadGroup"
    }
    ### Resources associated with test department catalog
    test_association = {
      catalog_id             = azuread_access_package_catalog.catalog["test_catalog"].id
      resource_origin_id     = azuread_group.group["test_resources"].object_id
      resource_origin_system = "AadGroup"
    }
  }
}
### Assign principal object to catalog roles
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_catalog_role_assignment

locals {
  catalog_role_assignment = {
    ### Catalog role assignment development department catalog
    dev_role_assignment = {
      role_id             = data.azuread_access_package_catalog_role.catalog_owner.object_id
      principal_object_id = data.azuread_user.Tom_Aril_Virak.object_id
      catalog_id          = azuread_access_package_catalog.catalog["dev_catalog"].id
    }
    ### Catalog role assignment test department catalog
    test_role_assignment = {
      role_id             = data.azuread_access_package_catalog_role.catalog_owner.object_id
      principal_object_id = data.azuread_user.Tom_Aril_Virak.object_id
      catalog_id          = azuread_access_package_catalog.catalog["test_catalog"].id
    }
  }
}
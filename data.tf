### Configure data values

### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user
# Owner of catalogs
data "azuread_user" "Tom_Aril_Virak" {
  user_principal_name = "Mendel@3rpvyj.onmicrosoft.com"
}

### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/access_package_catalog_role
# creates catalog owner role
data "azuread_access_package_catalog_role" "catalog_owner" {
  display_name = "Catalog owner"
}
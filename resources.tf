### Configure resources

### For each loop creating Entra ID Groups defined in entra_id_groups_locals.tf
resource "azuread_group" "group" {
  for_each = local.groups

  display_name     = each.value.display_name
  security_enabled = each.value.security_enabled
}


### For each loop creating access package catalogs defined in access_package_catalog_locals.tf
resource "azuread_access_package_catalog" "catalog" {
  for_each = local.catalogs

  display_name = each.value.display_name
  description  = each.value.description
}


### For each loop creating access package resource catalog associations defined in catalog_association_locals.tf
resource "azuread_access_package_resource_catalog_association" "catalog_association" {
  for_each = local.catalog_associations

  catalog_id             = each.value.catalog_id
  resource_origin_id     = each.value.resource_origin_id
  resource_origin_system = each.value.resource_origin_system
}

### For each loop creating access package catalog role assignment defined in catalog_role_assignment_locals.tf
resource "azuread_access_package_catalog_role_assignment" "example" {
  for_each = local.catalog_role_assignment

  role_id             = each.value.role_id
  principal_object_id = each.value.principal_object_id
  catalog_id          = each.value.catalog_id
}

### For each loop creating access packages defined in access_package_locals.tf
resource "azuread_access_package" "access_package" {
  for_each = local.access_packages

  catalog_id   = each.value.catalog_id
  display_name = each.value.display_name
  description  = each.value.description
}


### For each loop creating access package resource package associations defined in resource_package_association_locals.tf
resource "azuread_access_package_resource_package_association" "resource_package_association" {
  for_each = local.resource_package_associations

  access_package_id               = each.value.access_package_id
  catalog_resource_association_id = each.value.catalog_resource_association_id
}


### For each loop creating access package assignment policy defined in aaccess_package_assignment_policy_locals.tf
resource "azuread_access_package_assignment_policy" "assignment_policy" {
  for_each = local.assignment_policies

  access_package_id = each.value.access_package_id
  display_name      = each.value.display_name
  description       = each.value.description
  duration_in_days  = each.value.duration_in_days

  requestor_settings {
    scope_type = each.value.requestor_settings.scope_type
  }

  approval_settings {
    approval_required = each.value.approval_settings.approval_required

    approval_stage {
      approval_timeout_in_days = each.value.approval_settings.approval_stage.approval_timeout_in_days

      primary_approver {
        object_id    = each.value.approval_settings.approval_stage.primary_approver.object_id
        subject_type = each.value.approval_settings.approval_stage.primary_approver.subject_type
      }
    }
  }

  assignment_review_settings {
    enabled                        = each.value.assignment_review_settings.enabled
    review_frequency               = each.value.assignment_review_settings.review_frequency
    duration_in_days               = each.value.assignment_review_settings.duration_in_days
    review_type                    = each.value.assignment_review_settings.review_type
    access_review_timeout_behavior = each.value.assignment_review_settings.access_review_timeout_behavior
  }

  question {
    text {
      default_text = each.value.question.text.default_text
    }
  }
}
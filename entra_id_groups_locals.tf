### Used to create Entra ID groups
## https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group

locals {
  groups = {
    ### Entra ID groups for access package assignment policy approvers
    dev_approver = {
      display_name     = lower("dev-group-approver")
      security_enabled = true
    }

    test_approver = {
      display_name     = lower("test-group-approver")
      security_enabled = true
    }

    ### Entra ID groups for access package resorce roles
    dev_resources = {
      display_name     = lower("dev-group-resources")
      security_enabled = true
    }
    dev_resources2 = {
      display_name     = lower("dev-group-resources2")
      security_enabled = true
    }
    test_resources = {
      display_name     = lower("test-group-resources")
      security_enabled = true
    }
  }
}
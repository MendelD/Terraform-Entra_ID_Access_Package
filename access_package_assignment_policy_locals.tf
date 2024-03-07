### Assign approvers and resource roles to access packages
### https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_assignment_policy

locals {
  assignment_policies = {
    ### Assignment policy for development access package
    dev_assignment_policy = {
      access_package_id = azuread_access_package.access_package["dev_access_package"].id # Access package 
      display_name      = lower("dev-assignment_policy")                                 # Displayname you want for this assignment policy
      description       = "Test access package assignment policy using Terraform"        # Description you want for this assignment policy
      duration_in_days  = 90                                                             # How long you want this assignment policy to last

      requestor_settings = {
        scope_type = "AllExistingDirectoryMemberUsers" # Who can request this assignment policy
      }

      approval_settings = {
        approval_required = true # Require approval (true/false)

        approval_stage = {
          approval_timeout_in_days = 14 # How long do approver have to respond

          primary_approver = {
            object_id    = azuread_group.group["dev_approver"].object_id # Approver users or groups
            subject_type = "groupMembers"
          }
        }
      }
      assignment_review_settings = {
        enabled                        = true # Whether to enable access review (true/false)
        review_frequency               = "weekly" # This will determine how often the access review campaign runs (weekly, monthly, quarterly, halfyearly or annualy)
        duration_in_days               = 3 # (Number) How many days each occurrence of the access review series will run
        review_type                    = "Self" # Self-review or specific reviewers (Manager, Reviewers, or Self)
        access_review_timeout_behavior = "keepAccess" # Specifies the actions the system takes if reviewers don't respond in time. (keepAccess, removeAccess or acceptAccessRecommendation)
      }

      question = { # One or more question blocks for the requestor (choise, required, sequence or text)
        text = {
          default_text = "What is your purpose?"
        }
      }
    }

    ### Assignment policy for development access package 2
    dev_assignment_policy2 = {
      access_package_id = azuread_access_package.access_package["dev_access_package2"].id
      display_name      = lower("dev-assignment_policy")
      description       = "Test access package assignment policy using Terraform"
      duration_in_days  = 90

      requestor_settings = {
        scope_type = "AllExistingDirectoryMemberUsers"
      }

      approval_settings = {
        approval_required = true

        approval_stage = {
          approval_timeout_in_days = 14

          primary_approver = {
            object_id    = azuread_group.group["dev_approver"].object_id
            subject_type = "groupMembers"
          }
        }
      }
      assignment_review_settings = {
        enabled                        = true
        review_frequency               = "weekly"
        duration_in_days               = 3
        review_type                    = "Self"
        access_review_timeout_behavior = "keepAccess"
      }

      question = {
        text = {
          default_text = "What is your purpose?"
        }
      }
    }

    ### Assignment policy for test access package
    test_assignment_policy = {
      access_package_id = azuread_access_package.access_package["test_access_package"].id
      display_name      = lower("test-assignment_policy")
      description       = "Test access package assignment policy using Terraform"
      duration_in_days  = 90

      requestor_settings = {
        scope_type = "AllExistingDirectoryMemberUsers"
      }

      approval_settings = {
        approval_required = true

        approval_stage = {
          approval_timeout_in_days = 14

          primary_approver = {
            object_id    = azuread_group.group["test_approver"].object_id
            subject_type = "groupMembers"
          }
        }
      }
      assignment_review_settings = {
        enabled                        = true
        review_frequency               = "weekly"
        duration_in_days               = 3
        review_type                    = "Self"
        access_review_timeout_behavior = "keepAccess"
      }

      question = { 
        text = {
          default_text = "What is your purpose?"
        }
      }
    }
  }
}
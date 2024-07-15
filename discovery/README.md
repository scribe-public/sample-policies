# Discovery Policies

This README provides an overview of the set of policy rules that utilize discovery evidences. Each policy rule is described along with its basic use cases. The purpose of this document is to provide a comprehensive understanding of the policies and their intended applications.

## Table of Contents

1. [GitLab Organization Attestation](#gitlab-organization-attestation)
   1. [User](#user)
      1. [Check Users against an Allowlist](#check-users-against-an-allowlist)
      2. [Check Users against a Blocklist](#check-users-against-a-blocklist)
      3. [Check Admin Users against an Allowlist](#check-admin-users-against-an-allowlist)
      4. [Verify Number of Admins](#verify-number-of-admins)
   2. [Token](#token)
      1. [Unused Tokens](#unused-tokens)
      2. [Shortly Expiring Tokens](#shortly-expiring-tokens)
      3. [Tokens with too long lifetime](#tokens-with-too-long-lifetime)
      4. [Forbid Specific Scopes](#forbid-specific-scopes)
      5. [Allowed Scopes](#allowed-scopes)
   3. [Projects](#projects)
      1. [Projects Visibility](#projects-visibility)
      2. [Inactive Projects](#inactive-projects)
2. [GitLab Project Attestation](#gitlab-project-attestation)
   1. [Abandoned Projects](#abandoned-projects)
   2. [Visibility Check](#visibility-check)
   3. [Push Rules](#push-rules)
      1. [No Push Rules set](#no-push-rules-set)
      2. [Member check](#member-check)
      3. [Prevent Secrets](#prevent-secrets)
      4. [Author Email Regex check](#author-email-regex-check)
      5. [Committer check](#committer-check)
      6. [Reject Unsigned Commits](#reject-unsigned-commits)
   4. [Number of Approvals Required for Merge](#number-of-approvals-required-for-merge)
   5. [Branch Protection](#branch-protection)
      1. [Push Access Level](#push-access-level)
      2. [Merge Access Level](#merge-access-level)
      3. [Force Push Protection](#force-push-protection)
      4. [Code Owner Approval Required](#code-owner-approval-required)
   6. [Commit check](#commit-check)
      1. [Author Email check](#author-email-check)
      2. [Author Name check](#author-name-check)
      3. [Committer Email check](#committer-email-check)
      4. [Committer Name check](#committer-name-check)
      5. [Commit Message check](#commit-message-check)
      6. [Commit Validation check](#commit-validation-check)
3. [K8s Namespace Attestation](#k8s-namespace-attestation)
   1. [Verify Allowed Registries](#verify-allowed-registries)
4. [GitLab Pipeline Attestation (not implemented)](#gitlab-pipeline-attestation)
   1. [Labels](#labels)
      1. [Check Label Existance](#check-label-existance)
      2. [Check Label Value](#check-label-value)
   2. [Pods (not implemented)](#pods)
      1. [Check Image Existance by Name (not implemented)](#check-image-existance-by-name)
   3. [Secrets check (not implemented)](#secrets-check)

Please refer to the respective sections below for detailed information on each policy rule.

## GitLab Organization Attestation

### User

#### Check Users against an Allowlist

Takes a list of allowed users as an input and checks if the users in the organization are part of the allowlist.

```yaml
with:
  allowed_users:
    - user1
    - user2
```

#### Check Users against a Blocklist

Takes a list of blocked users as an input and checks if the users in the organization are part of the blocklist.

```yaml
with:
  blocked_users:
    - user1
    - user2
```

#### Check Admin Users against an Allowlist

Takes a list of allowed admin users as an input and checks if the admin users in the organization are part of the allowlist.

```yaml
with:
  allowed_admins:
    - user1
    - user2
```

#### Verify Number of Admins

Takes the minimum number of admins required as an input and checks if the organization has not more than the specified number of admins.

```yaml
with:
  max_admins: 2
```

### Token

#### Unused Tokens

Takes as input the number of days since the last usage of the token. For each token the rule checks if the token has been used in the last `n` days.

```yaml
with:
  unused_for_days: 90
```

#### Shortly Expiring Tokens

Takes as input the number of days before the token expires. For each token the rule checks if the token will expire in the next `n` days.

```yaml
with:
  exiring_in_days: 30
```

#### Tokens with too long lifetime

Takes as input the maximum number of days a token can be valid. For each token the rule checks if the token is valid for more than `n` days.

```yaml
with:
  exiring_in_days: 365
```

#### Forbid Specific Scopes

Takes a list of scopes as input and checks if any token has the specified scopes.

```yaml
with:
  project_scopes:
    - read_api
    - write_repository
```

#### Allowed Scopes

Takes a list of scopes as input and checks if any token has the specified scopes.

```yaml
with:
  allowed_token_scopes:
    - write_repository
    - read_api
```

### Projects

All the [Push Rules](#push-rules) and [Branch Protection](#branch-protection) rules can be applied to projects here as well. But in order to do so, we need to adjust JSON paths in rego scripts.

#### Projects Visibility

Takes a list of projects that can be public and checks if any project is public.

```yaml
with:
  allowed_public:
    - project1
    - project2
```

#### Inactive Projects

Based on a project timestamp in the `last_activity` field, the rule checks if any project has been inactive for more than `n` days.

```yaml
with:
  inactive_for_days: 90
```

## GitLab Project Attestation

### Abandoned Projects

Based on a project timestamp in the `last_activity` field, the rule checks if the project has been inactive for more than `n` days.

```yaml
with:
  inactive_for_days: 30
```

### Visibility Check

Check if the project is public or private.

```yaml
with:
  visibility: public
```

### Push Rules

#### No Push Rules set

Basically check if the `push_rules` field equals `null`.

#### Member check

Verify the state of the `member_check` field.

#### Prevent Secrets

Verify if the `prevent_secrets` field is set to `true`.

#### Author Email Regex check

Verify if the `author_email_regex` field is set to a specific regex (can be empty as well).

```yaml
with:
  author_email_regex: ".*@example.com"
```

#### Committer check

Verify if the `commit_committer_check` field is set to `true`.

#### Reject Unsigned Commits

Verify that the `reject_unsigned_commits` field is set to `true`.

> No suitable example yet.

### Number of Approvals Required for Merge

Verify that the number of approvals required for merge is greater than or equal to a specified number.

> For some reason, this is only available for projects under an organization attestation.

```yaml
with:
  name: "All Members"
  approvals_required_min: 2
```

### Branch Protection

#### Push Access Level

Verify the `access_level` field in push rules.

```yaml
with:
  branch: "main"
  access_level: 40
```

ALternatively, this rule can be evaluated agains the `access_level_description` field.

```yaml
with:
  branch: "main"
  access_level_description: "Maintainers"
```

#### Merge Access Level

Verify the `access_level` field in merge rules.

```yaml
with:
  branch: "main"
  access_level: 40
```

ALternatively, this rule can be evaluated agains the `access_level_description` field.

```yaml
with:
  branch: "main"
  access_level_description: "Maintainers"
```

#### Force Push Protection

Verify if the `allow_force_push` field is set to `false`.

```yaml
with:
  branch: "main"
```

#### Code Owner Approval Required

Verify if the `code_owner_approval_required` field is set to `true`.

```yaml
with:
  branch: "main"
```

### Commit check

#### Author Email check

Verify that all the authors of the commits in the project have emails from the llowed list

```yaml
with:
  allowed_authors:
    - mail@example.com
```

Alternatively, we can check for a specific regex.

```yaml
with:
  author_email_regex: ".*@example.com"
```

#### Author Name check

Verify that all the committers of the commits in the project have names from the allowed list.

```yaml
with:
  allowed_authors:
    - name1
    - name2
```

#### Committer Email check

Verify that all the committers of the commits in the project have emails from the allowed list.

```yaml
with:
  allowed_committers:
    - mail@example.com
```

Alternatively, we can check for a specific regex.

```yaml
with:
  committer_email_regex: ".*@example.com"
```

#### Committer Name check

Verify that all the committers of the commits in the project have names from the allowed list.

```yaml
with:
  allowed_committers:
    - name1
    - name2
```

#### Commit Message check

Verify that all the commit messages in the project meet the specified regex (for example, have JIRA task number).

```yaml
with:
  commit_message_regex: ".*JIRA-\\d+.*"
```

#### Commit Validation check

Verify that all the commits in the project have been validated.

## Gitlab API

### Signed commits

#### GL Signed Commits List

Verify that the selected commits have been signed

```yaml
with:
  commit_id_list: []
  private_token: ""
  project_id: ""
```

<u>All fields must contain values</u>

`commit_id_list` is a list that contains the commit id or commit SHA (same term).

`private_token` is your personal acccess token.

`project_id` is the projects ID, can be found on Gitlab.

#### GL Signed Commits Range

Verify that the selected range of commits have been signed. Be cautious multiple Api fetch requests will be made which may take longer than other policies. If there are a lot of commits, it might be beneficial to include query paramters `since` and `until`.

```yaml
with:
  since: "" # ISO 8601 date-time string (optional)
  until: "" # ISO 8601 date-time string (optional)
  project_id: ""
  private_token: ""
```

<u>All fields besides since and until are mandatory</u>

`since` and `until` are both query parameters.

`project_id` is your project's ID. Can be found on Gitlab.

`private_token` is your personal access token.

## Github API

### Signed Commits

#### GH Signed Commits List

Verify that the selected commits have been signed.

```yaml
with:
  commit_id_list: []
  access_token: ""
  owner: ""
  repo: ""
```

<u> All fields must be given values. </u>

`access_token` is your Github's personal access token.

`owner` is the owner of the repo.

`repo` is the name of the repository that you are trying to access the commits.

#### GH Signed Commits Range

Verify that the selected range of commits have been signed.

```yaml
with:
  # Required
  access_token: ""
  owner: ""
  repo: ""
  # Optional
  since: # ISO 8601 date-time string
  until: # ISO 8601 date-time string
  sha:
```

<u> `access_token`, `owner`, and `repo` must all be given string values. </u>

`since`, `until`, `sha` are optional query parameters.

Both `since` and `until` are ISO 8601 date-time strings.

When `sha` is specified, it allows you to set a range from the specific sha of the commit to the head.

`access_token` is your Github's personal access token.

`owner` is the owner of the repo.

`repo` is the name of the repository that you are trying to access the commits.

## Github Repository Attestation

### Signed Commits

Verify that the commits have been signed in a repository attestation.

### Gitlab Approval Settings Policies

#### Dissallowed Banned Approvers

Verify that the no approvers are on the banned list. Banned List requires addidtion implementation for how user objects are passed. (Not completed)

```yaml
with:
  # You can configure the list of banned users here. 
  # Enter in a list format the ID of the banned users
  banned_list:
    - "1"
    - "2"

```

#### Required Minimal Approvers

Verify that the required number of approvers from config-file is met. Required Number is taken from evidence, in required_approvals under approval_settings

### Test Binary Fields

#### Disable Ovveriding Approvers per Merge Request

Verify that the binary field: 'disable_overriding_approvers_per_merge_request' is set correctly

``` yaml
with:
  # You can configure the value of the binary field here
  disable_overriding_approvers_per_merge_request: 
```

#### Merge Requests Author Approval

Verify that the binary field: 'merge_requests_disable_committers_approval' is set correctly

```yaml
with:
  # You can configure the value of the binary field here
  merge_requests_disable_committers_approval: false
```

#### Merge Requests Disable Committers Approval

Verify that the binary field: 'merge_requests_disable_committers_approval' is set correctly

```yaml
with:
  # You can configure the value of the binary field here
  merge_requests_disable_committers_approval: false
```
#### Require Password to Approve 

Verify that the binary field: 'require_password_to_approve' is set correctly

```yaml
with:
  # You can configure the value of the binary field here
  require_password_to_approve: true
```

#### Reset Approvals on Push

Verify that the binary field: 'reset_approvals_on_push' is set correctly

```yaml
with:
  # You can configure the value of the binary field here
  reset_approvals_on_push: 
```

#### Selective Code Owner Removals

Verify that the binary field: 'selective_code_owner_removals' is set correctly

```yaml
with:
  # You can configure the value of the binary field here
  selective_code_owner_removals: true
```

## K8s Namespace Attestation

Any rules that can be run on an image SBOM can be mentioned here. We can use hash from the `imageID` field to filter by image.

### Verify Allowed Registries

Verify that the image is from one of the allowed registries.

```yaml
with:
  allowed_registries:
    - "gcr.io"
```

## GitLab Pipeline Attestation

### Labels

#### Check Label Existance

Verify that labels from the specified list exist.

```yaml
with:
  labels:
    - label1
    - label2
```

#### Check Label Value

Verify that the specified label has the specified value.

```yaml
with:
  label:
    - label1: value1
    - label2: value2
```

### Pods

#### Check Image Existance by Name

> Can also be used on hash / containerID.

### Secrets check

> The only available example has an empty list here, so not clear what to check yet.

## Github Policies

### Github Testing Organiziton Details Binary Attributes

The following policies will ensure that binary fields are correctly set

#### Testing Binary Fields Advanced Security Enabled for New Repositories

A rule to verify that the binary field: advanced_security_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Dependabot Alerts Enbaled for New Repositories

A rule to verify that the binary field: dependabot_alerts_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Dependabot Secuirty Updates Enabled for New Repositories

A rule to verify that the binary field: dependabot_security_updates_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Dependency Graph Enabled for New Repositories

A rule to verify that the binary field: dependency_graph_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Members Can Create Private Repositories

A rule to verify that the binary field: members_can_create_private_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Members Can Create Repositories

A rule to verify that the binary field: members_can_create_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Secret Scanning Enabled for New Repositories

A rule to verify that the binary field: secret_scanning_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Secret Scanning Push Protection Custom Link Enabled

A rule to verify that the binary field: secret_scanning_push_protection_custom_link_enabled is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Secret Scanning Push Protection Enabled for New Repositories

A rule to verify that the binary field: secret_scanning_push_protection_enabled_for_new_repositories is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Secret Scanning Validity Checks Enabled

A rule to verify that the binary field: secret_scanning_validity_checks_enabled is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Two Factor Requirement Enabled

A rule to verify that the binary field: two_factor_requirement_enabled is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

#### Testing Binary Fields Web Commit Signoff Required

A rule to verify that the binary field: web_commit_signoff_required is properly set

```yaml
with:
  desired_value: false # Enter true or false
```

### Secret Policies - Organization Attestation

#### Fail on Old Secrets

A rule to verify that secrets are not older than max_secret_age (age in months)

```yaml
with:
  max_secret_age: 12 # number of months
```

### Policies - Organization Attestation

#### Fail on Repo Visibility

A rule to verify that only predefined public repos are permitted

```yaml
with:
  allowed_repo_names: # Regex patterns
    - "scribe-.*"
    - "scribe-security/.*"
```

### Test Security and Analysis - Organization Attestation

#### Secret Scanning

A rule to verify that `secret_scanning` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_enabled_for_new_repositories` located in `project.organization.result_object.organization_details.secret_scanning_enabled_for_new_repositories` and ensures that this value matches the field `project.repository[_].result_object.security_and_analysis.secret_scanning.status` for each `project.repository`.

#### Secret Scanning Push Protection

A rule to verify that `secret_scanning_push_protection` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_push_protection` located in `project.organization.result_object.organization_details.secret_scanning_push_protection` and ensures that this value matches the field `project.repository[_].result_object.security_and_analysis.secret_scanning_push_protection.status` for each `project.repository`.

#### Dependabot Security Updates

A rule to verify that `dependabot_security_updates_enabled_for_new_repositories` in `security_and_analysis` is properly set. It checks the boolean field `dependabot_security_updates_enabled_for_new_repositories` located in `project.organization.result_object.organization_details.dependabot_security_updates_enabled_for_new_repositories` and ensures that this value matches the field `project.repository[_].result_object.security_and_analysis.dependabot_security_updates.status` for each `project.repository`.

#### Secret Scanning Validity Checks

A rule to verify that `secret_scanning_validity_checks_enabled` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_validity_checks_enabled` located in `project.organization.result_object.organization_details.secret_scanning_validity_checks_enabled` and ensures that this value matches the field `project.repository[_].result_object.security_and_analysis.secret_scanning_validity_checks.status` for each `project.repository`.

### Test Security and Analysis - Repository Attestation

#### Secret Scanning

A rule to verify that `secret_scanning` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_enabled_for_new_repositories` located in `project.ancestors[0].result_object.organization_details.secret_scanning_enabled_for_new_repositories` and ensures that this value matches the field `project.repository.result_object.security_and_analysis.secret_scanning.status`.

#### Secret Scanning Push Protection

A rule to verify that `secret_scanning_push_protection` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_push_protection` located in `project.ancestors[0].result_object.organization_details.secret_scanning_push_protection` and ensures that this value matches the field `project.repository.result_object.security_and_analysis.secret_scanning_push_protection.status`.

#### Dependabot Security Updates

A rule to verify that `dependabot_security_updates_enabled_for_new_repositories` in `security_and_analysis` is properly set. It checks the boolean field `dependabot_security_updates_enabled_for_new_repositories` located in `project.ancestors[0].result_object.organization_details.dependabot_security_updates_enabled_for_new_repositories` and ensures that this value matches the field `project.repository[_].result_object.security_and_analysis.dependabot_security_updates.status`.

#### Secret Scanning Validity Checks

A rule to verify that `secret_scanning_validity_checks_enabled` in `security_and_analysis` is properly set. It checks the boolean field `secret_scanning_validity_checks_enabled` located in `project.ancestors[0].result_object.organization_details.secret_scanning_validity_checks_enabled` and ensures that this value matches the field `project.repository.result_object.security_and_analysis.secret_scanning_validity_checks.status`.

### Repository Attestation Policies

#### Fail on Repo Visibility

A rule to verify that only predefined public repos are permitted. You may add other allowed public repo names to the list in the configuration file.

```yaml
with:
  allowed_repo_names: # Regex patterns
    - "scribe-.*"
    - "scribe-security/.*"
```

#### Fail on Branch Protected

A rule to verify that branch protected is set to the desired value in the configuration file.

```yaml
with:
  desired_protected: true # Will fail for branches that do not share the same value as this one.
```

#### Fail on Branch Verified

A rule to verify that branch verified is set to the value defined in the configuration file.

```yaml
with:
  desired_verified: true # Will fail for branches that do not share the same value as this one.
```

#### Fail on Old Secrets

A rule to verify that secrets are not older than max_secret_age (age in months)

```yaml
with:
  max_secret_age: 12 # number of months
```

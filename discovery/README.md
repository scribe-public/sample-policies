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

## FS Tracker

### Using Superset Database 

#### Prevent Modification of Executable Files

This policy aims to ensure the integrity of executables by verifying that no unauthorized modifications occur during the pipeline execution. Use the optional filters to customize the scope of the checks according to your specific requirements.

```yaml
with:
  superset:
    filters:
      # Optional Filters
      mainAttestation_list: []          # list of strings for attestation that will be checked
      pipelineRun_list: []              # list of strings for pipelineRun that will be checked
      accepted_exec_cmd_line_list: []   # list of strings for accepted command lines that will not be checked
      accepted_output_cmd_line_list: [] # list of strings for accepted command lines that will not be checked
      accepted_path_regex_list: []            # list of strings for accepted path regexes that will not be checked
```

`mainAttestation_list`: Only checks attestations inside the list. 

`pipelineRun_list`: Only checks pipeline runs inside the list. 

`accepted_exec_cmd_line_list`: Specifies command lines that are accepted and will not be checked for modifications.

`accepted_output_cmd_line_list`: Specifies command lines whose outputs are accepted and will not be checked for modifications.

`accepted_path_regex_list`: Specifies path regexes' that are accepted and will not be checked for modifications.

#### Prevent Modification of Source Files

```yaml
with:
  superset:
    # Required Filters
    executable_1_list: []
    not_executable_2_list: []
      
    # Optional Filters
    mainAttestation_list: []          # list of strings for attestation that will be checked
    pipelineRun_list: []              # list of strings for pipelineRun that will be checked
    accepted_exec_cmd_line_list: []   # list of strings for accepted command lines that will not be checked
    accepted_output_cmd_line_list: [] # list of strings for accepted command lines that will not be checked
    # accepted_path_list: []            # list of strings for accepted path that will not be checked
    accepted_path_regex_list: []      # list of strings for accepted path regexes that will not be checked

```

`executable_1_list`: Only checks executable_1 inside the list.

`not_executable_2_list`: Only checks executable_2 not inside the list.

`mainAttestation_list`: Only checks attestations inside the list. 

`pipelineRun_list`: Only checks pipeline runs inside the list. 

`accepted_exec_cmd_line_list`: Specifies command lines that are accepted and will not be checked for modifications.

`accepted_output_cmd_line_list`: Specifies command lines whose outputs are accepted and will not be checked for modifications.

`accepted_path_regex_list`: Specifies path regexes' that are accepted and will not be checked for modifications.


#### Command Line Input Check

Verify that no specific command lines have been used. Outputs all paths that uses the same command line provided in the list of command line to check `command_line_list` in the config file. 

```yaml
with:
  superset:
    filters:
      # Required Filters
      command_line_list: ["{docker,stop,fs-tracker-9730580849}"]             # list of strings for command lines that will be checked

      # Optional Filters
      mainAttestation_list: []          # list of strings for attestation that will be checked
      pipelineRun_list: []              # list of strings for pipelineRun that will be checked
      accepted_path_regex_list: []      # list of strings for accepted path regexes that will not be checked
```


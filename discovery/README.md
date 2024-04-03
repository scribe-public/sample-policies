# Discovery Policies

This README provides an overview of the set of policy rules that utilize discovery evidences. Each policy rule is described along with its basic use cases. The purpose of this document is to provide a comprehensive understanding of the policies and their intended applications.

## Table of Contents

1. [GitLab Organization Attestation (not implemented)](#gitlab-organization-attestation)
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
    3. [Projects (not implemented)](#projects)
        1. [Projects Visibility (not implemented)](#projects-visibility)
        2. [Inactive Projects (not implemented)](#inactive-projects)
2. [GitLab Project Attestation (not implemented)](#gitlab-project-attestation)
    1. [Abandoned Projects (not implemented)](#abandoned-projects)
    2. [Visibility Check (not implemented)](#visibility-check)
    3. [Push Rules (not implemented)](#push-rules)
        1. [No Push Rules set (not implemented)](#no-push-rules-set)
        2. [Member check (not implemented)](#member-check)
        3. [Prevent Secrets (not implemented)](#prevent-secrets)
        4. [Author Email Regex check (not implemented)](#author-email-regex-check)
        5. [Committer check (not implemented)](#committer-check)
        6. [Reject Unsigned Commits (not implemented)](#reject-unsigned-commits)
    4. [Number of Approvals Required for Merge (not implemented)](#number-of-approvals-required-for-merge)
    5. [Branch Protection (not implemented)](#branch-protection)
        1. [Access Level (not implemented)](#access-level)
        2. [Force Push Protection (not implemented)](#force-push-protection)
        3. [Code Owner Approval Required (not implemented)](#code-owner-approval-required)
    6. [Commit check (not implemented)](#commit-check)
        1. [Author Email check (not implemented)](#author-email-check)
        2. [Author Name check (not implemented)](#author-name-check)
        3. [Committer Email check (not implemented)](#committer-email-check)
        4. [Committer Name check (not implemented)](#committer-name-check)
        5. [Commit Message check (not implemented)](#commit-message-check)
        6. [Commit Validation check (not implemented)](#commit-validation-check)
3. [K8s POD Attestation (not implemented)](#k8s-pod-attestation)
4. [GitLab pipeline Attestation (not implemented)](#gitlab-pipeline-attestation)
    1. [Labels (not implemented)](#labels)
        1. [Check Label Existance (not implemented)](#check-label-existance)
        2. [Check Label Value (not implemented)](#check-label-value)
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
    inactive_for_days: 30
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

```yaml
with:
    member_check: true
```

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
    approvals_required_min: 2
```

### Branch Protection

> For these rules to be applied, the `branch_protection.result_object` value should be extracted to a JSON object.

#### Access Level

Verify either the `access_level` or `access_level_description` fields. One is numeric and the other is a text.

```yaml
with:
    access_level: 40
```

```yaml
with:
    access_level_description:
        - "Developers + Maintainers"
        - "user name"
```

#### Force Push Protection

Verify if the `allow_force_push` field is set to `false`.

#### Code Owner Approval Required

Verify if the `code_owner_approval_required` field is set to `true`.

### Commit check

#### Author Email check

Verify that all the authors of the commits in the project have emails from the llowed list

```yaml
with:
    allowed_authors:
        - email1
        - email2
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
        - email1
        - email2
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

## K8s POD Attestation

Any rules that can be run on an image SBOM can be mentioned here. We can use hash from the `imageID` field to filter by image.

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
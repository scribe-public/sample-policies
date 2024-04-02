# Discovery Policies

This README provides an overview of the set of policy rules that utilize discovery evidences. Each policy rule is described along with its basic use cases. The purpose of this document is to provide a comprehensive understanding of the policies and their intended applications.

## Table of Contents

Each paragraph below corresponds to a specific policy rule. The rules are categorized based on the type of evidence they utilize.

1. [GitLab Organization Attestation](#gitlab-organization-attestation)
    1. [User](#user)
        1. [Check Users against an Allowlist](#check-users-against-an-allowlist)
        2. [Check Users against a Blocklist](#check-users-against-a-blocklist)
        3. [Check Admin Users against an Allowlist](#check-admin-users-against-an-allowlist)
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
        4. [Author Email check](#author-email-check)
        5. [Committer check](#committer-check)
        6. [Reject Unsigned Commits](#reject-unsigned-commits)
    4. [Number of Approvals Required for Merge](#number-of-approvals-required-for-merge)
    5. [Branch Protection](#branch-protection)
        1. [Access Level](#access-level)
        2. [Force Push Protection](#force-push-protection)
        3. [Code Owner Approval Required](#code-owner-approval-required)
3. [K8s POD Attestation](#k8s-pod-attestation)
4. [K8s tekton pipeline Attestation](#k8s-tekton-pipeline-attestation)
    1. [Labels](#labels)
        1. [Check Label Existance](#check-label-existance)
        2. [Check Label Value](#check-label-value)
    2. [Pods](#pods)
        1. [Check Image Existance by Name](#check-image-existance-by-name)
    3. [Secrets check](#secrets-check)

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

### Token

#### Unused Tokens

Takes as input the number of days since the last usage of the token. For each token the rule checks if the token has been used in the last `n` days.

```yaml
with:
    unused_for_days: 30
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
    exiring_in_days: 30
```

#### Forbid Specific Scopes

Takes a list of scopes as input and checks if any token has the specified scopes.

```yaml
with:
    project_scopes:
        - read_api
        - write_repository
```

Additionally, we can verify permissions per token.

```yaml
with:
    forbid_token_permissions:
        token1:
            - read_api
        token2:
            - write_repository
            - read_api
```

#### Allowed Scopes

Takes a list of scopes as input and checks if any token has the specified scopes.

```yaml
with:
    allowed_token_permissions:
        token1:
            - read_api
        token2:
            - write_repository
            - read_api
```

### Projects

All the [Push Rules](#push-rules) and [Branch Protection](#branch-protection) rules can be applied to projects here as well.

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

#### Author Email check

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

## K8s POD Attestation

Any rules that can be run on an image SBOM can be mentioned here. We can use hash from the `imageID` field to filter by image.

## K8s tekton pipeline Attestation

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

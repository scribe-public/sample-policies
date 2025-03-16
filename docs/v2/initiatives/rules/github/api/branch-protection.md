---
sidebar_label: Branch protection enabled in GitHub repository
title: Branch protection enabled in GitHub repository
---  
# Branch protection enabled in GitHub repository  
**Type:** Rule  
**ID:** `github-api-branch-protection`  
**Source:** [v2/rules/github/api/branch-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/api/branch-protection.rego)  
**Labels:** GitHub  

Verify GitHub branch protection rules

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/api/branch-protection@v2
with:
  owner: "my-org"
  repo: "my-repo"
  branch: "main"
  branch_protection_rules:
    required_pull_request_reviews.dismiss_stale_reviews: true
    required_pull_request_reviews.require_code_owner_reviews: true
    required_pull_request_reviews.require_last_push_approval: true
    required_pull_request_reviews.required_approving_review_count: 2
    required_pull_request_reviews.bypass_pull_request_allowances.users: ["user1", "user2"]
    required_pull_request_reviews.bypass_pull_request_allowances.teams: ["team1"]
    required_pull_request_reviews.bypass_pull_request_allowances.apps: ["app1"]
    required_pull_request_reviews.dismissal_restrictions.users: ["user3"]
    required_pull_request_reviews.dismissal_restrictions.teams: ["team2"]
    required_pull_request_reviews.dismissal_restrictions.apps: ["app2"]
    required_status_checks.checks: ["check1", "check2"]
    required_status_checks.strict: true
    required_status_checks.contexts: ["context1", "context2"]
    restrictions.users: ["user4"]
    restrictions.teams: ["team3"]
    restrictions.apps: ["app3"]
    required_signatures: true
    enforce_admins: true
    required_linear_history: true
    allow_force_pushes: false
    allow_deletions: false
    block_creations: true
    required_conversation_resolution: true
    lock_branch: true
    allow_fork_syncing: true
```

## Description  
# This ones needs a large details
This rule ensures that the branch protection rules are configured in the GitHub repository.
It performs the following steps:

1. Checks the repository settings for branch protection configuration.
2. Verifies that the configuration matches the expected settings.
2.1. Verifies that the required pull request reviews are configured.
2.2. Verifies that the required status checks are configured.
2.3. Verifies that the restrictions are configured.
2.4. Verifies that the required signatures are configured.
2.5. Verifies that the enforcement of admins is configured.
2.6. Verifies that the required linear history is configured.
2.7. Verifies that the allow force pushes is configured.
2.8. Verifies that the allow deletions is configured.
2.9. Verifies that the block creations is configured.
2.10. Verifies that the required conversation resolution is configured.
2.11. Verifies that the lock branch is configured.
2.12. Verifies that the allow fork syncing is configured.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub repository settings.
- Github API token must be provided to access the GitHub API.


## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| api_token | `{{ .Args.Token }}` |
| owner | `{{ .Args.Owner }}` |
| repo | `{{ .Args.Repo }}` |
| branch | `{{ .Args.Branch }}` |
| branch_protection_rules | `{'required_pull_request_reviews.dismiss_stale_reviews': True, 'required_pull_request_reviews.require_code_owner_reviews': False, 'required_pull_request_reviews.require_last_push_approval': False, 'required_pull_request_reviews.required_approving_review_count': 1, 'required_pull_request_reviews.bypass_pull_request_allowances.users': [], 'required_pull_request_reviews.bypass_pull_request_allowances.teams': [], 'required_pull_request_reviews.bypass_pull_request_allowances.apps': [], 'required_pull_request_reviews.dismissal_restrictions.users': [], 'required_pull_request_reviews.dismissal_restrictions.teams': [], 'required_pull_request_reviews.dismissal_restrictions.apps': [], 'required_status_checks.checks': [], 'required_status_checks.strict': False, 'required_status_checks.contexts': [], 'restrictions.users': [], 'restrictions.teams': [], 'restrictions.apps': [], 'required_signatures': False, 'enforce_admins': False, 'required_linear_history': False, 'allow_force_pushes': False, 'allow_deletions': True, 'block_creations': False, 'required_conversation_resolution': False, 'lock_branch': False, 'allow_fork_syncing': False}` |


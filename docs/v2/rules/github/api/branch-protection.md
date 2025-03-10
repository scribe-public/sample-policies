# Rule: Branch protection enabled in GitHub repository

**ID**: `github-api-branch-protection`  
**Uses**: `github/api/branch-protection@v2/rules  
**Source**: [v2/rules/github/api/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/branch-protection.yaml)  
**Rego Source**: [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/branch-protection.rego)  
**Short Description**: Verify GitHub branch protection rules  
**Labels**: GitHub

## Rule Parameters (`with`)

```yaml
api_token: '{{ .Args.Token }}'
owner: '{{ .Args.Owner }}'
repo: '{{ .Args.Repo }}'
branch: '{{ .Args.Branch }}'
branch_protection_rules:
  required_pull_request_reviews.dismiss_stale_reviews: true
  required_pull_request_reviews.require_code_owner_reviews: false
  required_pull_request_reviews.require_last_push_approval: false
  required_pull_request_reviews.required_approving_review_count: 1
  required_pull_request_reviews.bypass_pull_request_allowances.users: []
  required_pull_request_reviews.bypass_pull_request_allowances.teams: []
  required_pull_request_reviews.bypass_pull_request_allowances.apps: []
  required_pull_request_reviews.dismissal_restrictions.users: []
  required_pull_request_reviews.dismissal_restrictions.teams: []
  required_pull_request_reviews.dismissal_restrictions.apps: []
  required_status_checks.checks: []
  required_status_checks.strict: false
  required_status_checks.contexts: []
  restrictions.users: []
  restrictions.teams: []
  restrictions.apps: []
  required_signatures: false
  enforce_admins: false
  required_linear_history: false
  allow_force_pushes: false
  allow_deletions: true
  block_creations: false
  required_conversation_resolution: false
  lock_branch: false
  allow_fork_syncing: false
```

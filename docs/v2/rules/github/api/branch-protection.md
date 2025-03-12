# Branch protection enabled in GitHub repository  
**Type:** Rule  
**ID:** `github-api-branch-protection`  
**Uses:** `github/api/branch-protection@v2/rules`  
**Source:** [v2/rules/github/api/branch-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/api/branch-protection.yaml)  
**Rego Source:** [branch-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/api/branch-protection.rego)  
**Labels:** GitHub  

Verify GitHub branch protection rules

:::tip 
Evidence **IS NOT** required for this rule.  
::: 
:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| api_token | {{ .Args.Token }} |
| owner | {{ .Args.Owner }} |
| repo | {{ .Args.Repo }} |
| branch | {{ .Args.Branch }} |
| branch_protection_rules | {'required_pull_request_reviews.dismiss_stale_reviews': True, 'required_pull_request_reviews.require_code_owner_reviews': False, 'required_pull_request_reviews.require_last_push_approval': False, 'required_pull_request_reviews.required_approving_review_count': 1, 'required_pull_request_reviews.bypass_pull_request_allowances.users': [], 'required_pull_request_reviews.bypass_pull_request_allowances.teams': [], 'required_pull_request_reviews.bypass_pull_request_allowances.apps': [], 'required_pull_request_reviews.dismissal_restrictions.users': [], 'required_pull_request_reviews.dismissal_restrictions.teams': [], 'required_pull_request_reviews.dismissal_restrictions.apps': [], 'required_status_checks.checks': [], 'required_status_checks.strict': False, 'required_status_checks.contexts': [], 'restrictions.users': [], 'restrictions.teams': [], 'restrictions.apps': [], 'required_signatures': False, 'enforce_admins': False, 'required_linear_history': False, 'allow_force_pushes': False, 'allow_deletions': True, 'block_creations': False, 'required_conversation_resolution': False, 'lock_branch': False, 'allow_fork_syncing': False} |

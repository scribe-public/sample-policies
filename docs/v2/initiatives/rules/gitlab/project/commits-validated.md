---
sidebar_label: Validate All Commits in GitLab Project
title: Validate All Commits in GitLab Project
---  
# Validate All Commits in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-all-commits-validated`  
**Source:** [v2/rules/gitlab/project/commits-validated.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commits-validated.yaml)  
**Rego Source:** [commits-validated.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commits-validated.rego)  
**Labels:** Gitlab, Project  

Verify all commits in the GitLab project are validated.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/project/commits-validated@v2/rules
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |


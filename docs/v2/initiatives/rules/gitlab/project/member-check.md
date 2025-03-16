---
sidebar_label: Enable Member Check for GitLab Project
title: Enable Member Check for GitLab Project
---  
# Enable Member Check for GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-member_check`  
**Source:** [v2/rules/gitlab/project/member-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/member-check.yaml)  
**Rego Source:** [member-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/member-check.rego)  
**Labels:** Gitlab, Project  

Verify `member_check` is enabled for the GitLab project.

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
uses: gitlab/project/member-check@v2

## Usage example

```yaml
with: gitlab/project/member-check@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |


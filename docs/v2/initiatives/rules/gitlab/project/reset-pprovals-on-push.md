---
sidebar_label: Reset Approvals on Push in GitLab Project
title: Reset Approvals on Push in GitLab Project
---  
# Reset Approvals on Push in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-reset-pprovals-on-push`  
**Source:** [v2/rules/gitlab/project/reset-pprovals-on-push.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/reset-pprovals-on-push.yaml)  
**Rego Source:** [reset-pprovals-on-push.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/reset-pprovals-on-push.rego)  
**Labels:** Gitlab, Project  

Verify `reset_approvals_on_push` is set for the GitLab project.

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
uses: gitlab/project/reset-pprovals-on-push@v2
with:
  reset_approvals_on_push: true
  
```

## Mitigation  
Ensure that the binary field `reset_approvals_on_push` is set for the GitLab project to prevent unauthorized approvals.


## Description  
This rule ensures that the binary field `reset_approvals_on_push` is set for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the binary field `reset_approvals_on_push` is set.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab project resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| reset_approvals_on_push | boolean | False | The binary field to enforce for resetting approvals on push. |


---
sidebar_label: Restrict Approvers Per Merge Request
title: Restrict Approvers Per Merge Request
---  
# Restrict Approvers Per Merge Request  
**Type:** Rule  
**ID:** `gitlab-project-approvers-per-merge-request`  
**Source:** [v2/rules/gitlab/project/approvers-per-merge-request.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvers-per-merge-request.yaml)  
**Rego Source:** [approvers-per-merge-request.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvers-per-merge-request.rego)  
**Labels:** Gitlab, Project  

Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project.

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
uses: gitlab/project/approvers-per-merge-request@v2
with:
  disable_overriding_approvers_per_merge_request: false
```

## Mitigation  
Ensure that the binary field Disable Overriding Approvers Per Merge Request reduces the risk of unauthorized access by setting it to the specified value.


## Description  
This rule ensures that the binary field Disable Overriding Approvers Per Merge Request is set for the GitLab project.

It performs the following steps:
1. Checks the settings of the GitLab project.
2. Verifies that the binary field Disable Overriding Approvers Per Merge Request is set.

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
| disable_overriding_approvers_per_merge_request | boolean | False | Whether to disable overriding approvers per merge request. |


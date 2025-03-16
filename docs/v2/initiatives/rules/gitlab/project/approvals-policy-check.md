---
sidebar_label: Merge approval policy check for GitLab project
title: Merge approval policy check for GitLab project
---  
# Merge approval policy check for GitLab project  
**Type:** Rule  
**ID:** `gitlab-project-merge-approval`  
**Source:** [v2/rules/gitlab/project/approvals-policy-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvals-policy-check.yaml)  
**Rego Source:** [approvals-policy-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/approvals-policy-check.rego)  
**Labels:** Blueprint, Gitlab, Project  

Verify the project's merge approval policy complies with requirements.

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
uses: gitlab/project/approvals-policy-check@v2
with:
  name: "All Members"
  approvals_required_min: 2
  
```

## Mitigation  
Ensure that the project's merge approval policy complies with requirements to prevent unauthorized merges.



## Description  
This rule ensures that the project's merge approval policy complies with requirements.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the project's merge approval policy matchinig the 'name' field.
2.1. Verifies that the project's merge approval policy requires a minimum number of approvals as specified in the 'approvals_required_min' field.

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
| name | string | True | Name of the group or user that must approve the merge request. |
| approvals_required_min | number | True | Minimum number of approvals required for merge requests. |


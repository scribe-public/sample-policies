---
sidebar_label: Set Push Access Level in GitLab Project
title: Set Push Access Level in GitLab Project
---  
# Set Push Access Level in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-push-access-level`  
**Source:** [v2/rules/gitlab/project/push-access-level.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/push-access-level.yaml)  
**Rego Source:** [push-access-level.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/push-access-level.rego)  
**Labels:** Gitlab, Project  

Verify the GitLab project's push access level policy complies with requirements.

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
uses: gitlab/project/push-access-level@v2
with:
  branch: "main"
  access_level: 30
  access_level_description: "Maintainers"
```

## Mitigation  
Ensure that the GitLab project's push access level complies with requirements to prevent unauthorized changes.


## Description  
This rule ensures that the GitLab project's push access level complies with requirements.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. For scoped branchs, verifies that the push access level complies with the specified requirements.

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
| branch | string | False | The branch to enforce push access level policy. |
| access_level | number | False | The access level to enforce for push access level policy. |
| access_level_description | string | False | The access level description to enforce for push access level policy. |


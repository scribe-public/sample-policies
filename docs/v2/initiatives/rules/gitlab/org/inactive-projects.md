---
sidebar_label: Ensure Active Projects in GitLab Organization
title: Ensure Active Projects in GitLab Organization
---  
# Ensure Active Projects in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-inactive-projects`  
**Source:** [v2/rules/gitlab/org/inactive-projects.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/inactive-projects.yaml)  
**Rego Source:** [inactive-projects.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/inactive-projects.rego)  
**Labels:** Gitlab, Organization  

Verify no GitLab organization projects are inactive.

:::note 
This rule requires Gitlab Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/org/inactive-projects@v2
with:
  inactive_for_days: 90
  
```

## Mitigation  
Ensure that no GitLab organization projects are inactive to prevent service disruption.



## Description  
This rule ensures that no GitLab organization projects are inactive.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that no projects are inactive.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab organization resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| inactive_for_days | number | False | Number of days before a project is considered inactive. |


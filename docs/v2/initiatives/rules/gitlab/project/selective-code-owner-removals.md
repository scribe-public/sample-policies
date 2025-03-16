---
sidebar_label: Restrict Selective Code Owner Removals in GitLab
title: Restrict Selective Code Owner Removals in GitLab
---  
# Restrict Selective Code Owner Removals in GitLab  
**Type:** Rule  
**ID:** `gitlab-project-selective-code-owner-removals`  
**Source:** [v2/rules/gitlab/project/selective-code-owner-removals.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/selective-code-owner-removals.yaml)  
**Rego Source:** [selective-code-owner-removals.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/selective-code-owner-removals.rego)  
**Labels:** Gitlab, Project  

Verify `selective_code_owner_removals` is set for the GitLab project.

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
uses: gitlab/project/selective-code-owner-removals@v2
with:
  selective_code_owner_removals: true
  
```

## Mitigation  
Ensure that `selective_code_owner_removals` is set for the GitLab project to prevent unauthorized changes.



## Description  
This rule ensures that `selective_code_owner_removals` is set for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that `selective_code_owner_removals` is set.

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
| selective_code_owner_removals | boolean | True | Indicates whether `selective_code_owner_removals` is set for the GitLab project. |


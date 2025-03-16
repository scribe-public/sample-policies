---
sidebar_label: Check CWE Compliance
title: Check CWE Compliance
---  
# Check CWE Compliance  
**Type:** Rule  
**ID:** `gitlab-project-check-cwe`  
**Source:** [v2/rules/gitlab/project/check-cwe.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-cwe.yaml)  
**Rego Source:** [check-cwe.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/check-cwe.rego)  
**Labels:** Gitlab, Project  

Verify that specified CWEs were not detected in the GitLab project.

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
uses: gitlab/project/check-cwe@v2
with:
  cwe_value: "89"
  
```

## Mitigation  
Ensure that the specified CWEs were not detected in the GitLab project to prevent vulnerabilities.


## Description  
This rule ensures that the specified CWEs were not detected in the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the specified CWEs were not detected in the GitLab project.

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
| cwe_value | string | True | The CWE value to check for. |

